import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:reno_puzzle/features/home_screen/data/list_image_provider.dart';

import '../data/home_provider.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lengthMatrix = ref.watch(lengthProvider);

    Future<List<String>> loadAssets() async {
      // Load as String
      final manifestContent =
      await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
    // print(manifestContent);
      // Decode to Map
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
        // print(manifestMap);
      // Filter by path
      final filtered = manifestMap.keys
          .where((path) => path.startsWith('assets/photo'))
          .toList();
      print(filtered);
      return filtered;

    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                ref
                    .read(listImageControllerProvider.notifier)
                    .splitImage(ref.read(photoProvider).value!, lengthMatrix);
              },
              child: const Icon(
                Icons.add,
                color: Colors.red,
              )),
          TextButton(
              onPressed: () async {
                await loadAssets();
                print('a');
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              child: Consumer(
                builder: (context, watch, _) {
                  final assets = ref.watch(assetsProvider);
                 return assets.when(
                     data: (data){
                       return ListView.builder(
                         itemCount: data.length,
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index){
                           return GestureDetector(
                               onTap: () async {
                                 final bytes = await rootBundle.load(data[index]);
                                 ref
                                     .read(listImageControllerProvider.notifier)
                                     .splitImage(bytes.buffer.asUint8List(), lengthMatrix);
                               },
                               child: Image.asset(data[index]));
                         }
                       );
                     },
                     error: (obj, stackTrade) => Text(stackTrade.toString()),
                     loading: () => const CircularProgressIndicator());

                },
              ),
            ),
            // Consumer(builder: (context, ref, child) {
            //   final photoFile = ref.watch(photoProvider);
            //   return photoFile.when(
            //       data: (data) {
            //         return Image.memory(data);
            //       },
            //       error: (obj, stackTrade) => Text(stackTrade.toString()),
            //       loading: () => const CircularProgressIndicator());
            // }),
            // Text(listImage.length.toString()),
            Consumer(builder: (context, ref, child) {
              final listImage = ref.watch(listImageControllerProvider);
              print('rebuild');
              return SizedBox(
                  width: 300,
                  height: 300,
                  child: listImage.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          itemCount: listImage.length * listImage[0].length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: listImage[0].length,
                              childAspectRatio: 1,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            int row = index ~/ listImage[0].length;
                            int col = index % listImage[0].length;
                            return GestureDetector(
                              onTap: () {
                                ref
                                    .read(listImageControllerProvider.notifier)
                                    .swapNeighborsWithValueZero([row, col]);
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  // child: Text('${listImage[index]}'));
                                  child: Image.memory(
                                      listImage[row][col].unit8List!)),
                            );
                          }));
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final ImagePicker _picker = ImagePicker();
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        File newFile = File(image!.path);
        ref
            .read(photoProvider.notifier)
            .updateUint8List(newFile.readAsBytesSync());
      }),
    );
  }
}
