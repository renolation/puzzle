

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

  final lengthProvider = StateProvider<int>((ref) {
  return 5;
});
final selectingProvider = StateProvider<int>((ref) {
  return 0;
});



final assetsProvider = FutureProvider((ref) async {
  final assetBundle = rootBundle;
  final assetListing = await assetBundle.loadString('AssetManifest.json');

  final Map<String, dynamic> manifestMap = json.decode(assetListing);
  final assets = manifestMap.keys
      .where((path) => path.startsWith('assets/photo'))
      .toList();
  return assets;
});


final photoProvider =
AsyncNotifierProvider<PhotoProvider, Uint8List>(() {
  return PhotoProvider();
});

class PhotoProvider extends AsyncNotifier<Uint8List> {

  Future<Uint8List> _fetchPhoto() async {
    final byteData = await rootBundle.load('assets/temp.jpg');
    final file = File('${(await getTemporaryDirectory()).path}/temp.jpg');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file.readAsBytesSync();
  }


  @override
  Future<Uint8List> build() async {
    return _fetchPhoto();
  }

  Future<void> updateUint8List(Uint8List bytes) async {
    // Set the state to loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return bytes;
    });
  }

}



