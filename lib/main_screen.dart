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
          // TextButton(
          //     onPressed: () {
          //       ref.read(listImageProvider.notifier).state.shuffle();
          //     },
          //     child: const Icon(
          //       Icons.add,
          //       color: Colors.black,
          //     )),
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
          // Text(listImage.length.toString()),
          Container(
              width: 300,
              height: 300,
              child: GridView.builder(
                  itemCount: listImage.length * listImage[0].length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: listImage[0].length,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    int row = index ~/ listImage[0].length;
                    int col = index % listImage[0].length;
                    return Container(
                        color: Colors.transparent,
                        // child: Text('${listImage[index]}'));
                        child: Image.memory(listImage[row][col].unit8List!));
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


}
