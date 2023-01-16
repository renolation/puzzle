import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:reno_puzzle/features/home_screen/data/list_image_provider.dart';

import '../data/home_provider.dart';
import '../data/timer_provider.dart';
import '../domains/puzzle.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          // TextButton(
          //     onPressed: () {
          //       ref
          //           .read(listImageControllerProvider.notifier)
          //           .splitImage(ref.read(photoProvider).value!, lengthMatrix);
          //     },
          //     child: const Icon(
          //       Icons.add,
          //       color: Colors.red,
          //     )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              child: Consumer(
                builder: (context, watch, _) {
                  final lengthMatrix = ref.watch(lengthProvider);
                  final assets = ref.watch(assetsProvider);
                  return assets.when(
                      data: (data) {
                        return ListView.builder(
                            itemCount: data.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  ref.read(selectingProvider.notifier).state =
                                      index;
                                  final bytes =
                                      await rootBundle.load(data[index]);
                                  ref
                                      .read(
                                          listImageControllerProvider.notifier)
                                      .splitImage(bytes.buffer.asUint8List(),
                                          lengthMatrix);
                                },
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset(
                                    data[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            });
                      },
                      error: (obj, stackTrade) => Text(stackTrade.toString()),
                      loading: () => const CircularProgressIndicator());
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer(builder: (context, ref, child) {
              final listImage = ref.watch(listImageControllerProvider);
              return SizedBox(
                  width: 300,
                  height: 300,
                  child: listImage.isEmpty
                      ? const SizedBox.expand(
                          child: Center(
                            child: Text('select'),
                          ),
                        )
                      : GridView.builder(
                          itemCount: listImage.length * listImage[0].length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: listImage[0].length,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            int row = index ~/ listImage[0].length;
                            int col = index % listImage[0].length;
                            return GestureDetector(
                              onTap: () {

                                final neighborsWithValueZero = ref
                                    .read(listImageControllerProvider.notifier)
                                    .swapNeighborsWithValueZero([row, col]);

                                if (neighborsWithValueZero.isNotEmpty) {

                                  if(ref.read(moveProvider.notifier).state == 0){
                                    ref.read(timerProvider.notifier).start();
                                  }

                                  ref.read(moveProvider.notifier).state += 1;
                                  ref
                                      .read(
                                          listImageControllerProvider.notifier)
                                      .swap(neighborsWithValueZero, [row, col]);
                                } else {
                                  print('wrong');
                                }
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  // child: Text('${listImage[index]}'));
                                  child: Image.memory(
                                      listImage[row][col].unit8List!)),
                            );
                          }));
            }),
            Consumer(builder: (context, ref, child) {
              final lengthMatrix = ref.watch(lengthProvider);
              final selectingIndex = ref.watch(selectingProvider);
              final assets = ref.watch(assetsProvider);
              return SizedBox(
                // height: 70,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Slider(
                        value: lengthMatrix.toDouble(),
                        min: 2,
                        max: 10,
                        onChanged: (value) {
                          ref.read(lengthProvider.notifier).state =
                              value.toInt();
                        }),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(lengthMatrix.toString()),
                        TextButton(
                          onPressed: () async {
                            final bytes = await rootBundle
                                .load(assets.value![selectingIndex]);
                            ref
                                .read(listImageControllerProvider.notifier)
                                .splitImage(
                                    bytes.buffer.asUint8List(), lengthMatrix);
                          },
                          child: const Text('ok'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            Consumer(builder: (context, ref, child) {
              final move = ref.watch(moveProvider);
              return Text('$move');
            }),
            Consumer(builder: (context, ref, child) {
              final timer = ref.watch(timerProvider);
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(secondsToMinutes(timer)),
                  TextButton(
                      onPressed: () {
                        ref.read(timerProvider.notifier).start();
                      },
                      child: const Text('start')),
                  TextButton(
                      onPressed: () {
                        ref.read(timerProvider.notifier).stop();
                      },
                      child: const Text('stop')),
                ],
              );
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

  String secondsToMinutes(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
