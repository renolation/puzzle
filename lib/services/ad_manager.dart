import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872~3722544004";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872~6923422417";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872/7139028926";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872/5362928734";
    } else {
      throw  UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872/5825947258";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872/1778906944";
    } else {
      throw  UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872/4233394482";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872/6783805703";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-5590864843607872/9294149474";
    } else if (Platform.isIOS) {
      return "ca-app-pub-5590864843607872/4349214055";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
