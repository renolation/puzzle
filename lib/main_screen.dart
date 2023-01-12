import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:reno_puzzle/providers.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoFile = ref.watch(photoProvider);
    final listImage = ref.watch(listImageControllerProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                ref
                    .read(listImageControllerProvider.notifier)
                    .splitImage(File(photoFile).readAsBytesSync());
              },
              child: const Icon(
                Icons.add,
                color: Colors.red,
              )),
          TextButton(
              onPressed: () {
                ref.read(listImageProvider.notifier).state.shuffle();
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              )),
        ],
      ),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.file(
            File(photoFile),
            height: 300,
            width: 300,
          ),
          Container(
              width: 300,
              height: 300,
              child: GridView.builder(
                  itemCount: listImage.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                        color: Colors.transparent,
                        // child: Text('${listImage[index].index}'));
                        child: Image.memory(listImage[index].unit8List!));
                  })),
        ],
      )),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final ImagePicker _picker = ImagePicker();
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        ref.read(photoProvider.notifier).state = image!.path;
      }),
    );
  }

  List<Image> splitImage(List<int> input) {
    // convert image to image from image package
    // img.Image? image = img.decodeImage(Uint8List.fromList(input));
    img.Image? image =
        cropCenterSquare(img.decodeImage(Uint8List.fromList(input)));
    int x = 0, y = 0;
    int width = (image!.width / 3).floor();
    int height = (image.height / 3).floor();

    // split image to parts
    List<img.Image> parts = <img.Image>[];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        parts
            .add(img.copyCrop(image, x: x, y: y, width: width, height: height));
        x += width;
      }
      x = 0;
      y += height;
    }

    // convert image from image package to Image Widget to display
    List<Image> output = <Image>[];
    for (var image in parts) {
      output.add(Image.memory(img.encodeJpg(image)));
    }
    print(output.length);
    return output;
  }

  img.Image? cropCenterSquare(img.Image? image) {
    int width = image!.width;
    int height = image.height;
    int left = 0;
    int top = 0;
    int right = 0;
    int bottom = 0;

    final shorterSide = width > height ? height : width;
    img.Image cropped = img.copyCrop(image,
        x: width ~/ 2 - shorterSide ~/ 2,
        y: height ~/ 2 - shorterSide ~/ 2,
        width: shorterSide,
        height: shorterSide);
    return cropped;
  }
}
