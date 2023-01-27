

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:reno_puzzle/services/ad_manager.dart';

final adControllerProvider = ChangeNotifierProvider((ref) => AdController());

class AdController extends ChangeNotifier {



   BannerAd? anchoredAdaptiveAd;
   bool isLoaded = false;


   loadBannerAd(BuildContext context) async {

    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());
    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    anchoredAdaptiveAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          anchoredAdaptiveAd = ad as BannerAd;
          isLoaded = true;
          notifyListeners();
          print('Ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
    );
    anchoredAdaptiveAd!.load();
  }

}

