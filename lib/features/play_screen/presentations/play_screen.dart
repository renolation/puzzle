
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reno_puzzle/features/home_screen/data/levels_controller.dart';
import '../../../providers/providers.dart';
import '../../../services/ad_controller.dart';
import '../../../utils/confetti_hook.dart';
import '../../../utils/custom_ui.dart';
import '../../home_screen/domains/levels.dart';
import '../data/list_image_provider.dart';
import '../data/timer_provider.dart';
import 'dart:developer' as dev;

class PlayScreen extends HookConsumerWidget {
  const PlayScreen({
    Key? key,
    required this.levels,
  }) : super(key: key);

  final Levels levels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(
      () {
        ref.read(listImageControllerProvider.notifier).convertAsset(levels.pathAsset, levels.matrix);
        ref.read(adControllerProvider.notifier).loadBannerAd(context);
        return null;
      },
      [],
    );

    final ConfettiController controllerCenter = useConfettiController(duration: const Duration(seconds: 10));

    ref.listen<int>(timerProvider(levels.time), (int? previousCount, int newCount) {
      if (newCount == 0) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Time is up'),
                content: const Text('Watch an ad to get more time?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                  TextButton(
                      onPressed: () {
                        // ref.read(timerProvider(levels.time).notifier).stop();
                        // ref.read(timerProvider(levels.time).notifier).reset();
                        // ref.read(moveProvider.notifier).state = 0;
                        // ref.read(listImageControllerProvider.notifier).convertAsset(levels.pathAsset, levels.matrix);
                        Navigator.pop(context);
                      },
                      child: const Text('Watch')),
                ],
              );
            },
            barrierDismissible: false);
      }
    });
    ref.listen<int>(moveProvider, (previous, next) {
      if (next == levels.step) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title:const  Text('No more step'),
                content: const Text('Watch an ad to get more step?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                  TextButton(
                      onPressed: () {
                        // ref.read(timerProvider(levels.time).notifier).stop();
                        // ref.read(timerProvider(levels.time).notifier).reset();
                        // ref.read(moveProvider.notifier).state = 0;
                        // ref.read(listImageControllerProvider.notifier).convertAsset(levels.pathAsset, levels.matrix);
                        Navigator.pop(context);
                      },
                      child: const Text('Watch')),
                ],
              );
            },
            barrierDismissible: false);
      }
    });

    return WillPopScope(
      onWillPop: () async {
          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: const Text('Your game will not save'),
              content: const Text('Are you sure?'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
                TextButton(onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }, child: const Text('Ok')),
              ],
            );
          });
          return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.volumeHigh)),
            const SizedBox(width: 8,),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,

          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 150,
            //   child: Consumer(
            //     builder: (context, watch, _) {
            //       final lengthMatrix = ref.watch(lengthProvider);
            //       final assets = ref.watch(assetsProvider);
            //       return assets.when(
            //           data: (data) {
            //             return ListView.builder(
            //                 itemCount: data.length,
            //                 scrollDirection: Axis.horizontal,
            //                 itemBuilder: (context, index) {
            //                   return GestureDetector(
            //                     onTap: () async {
            //                       ref.read(selectingProvider.notifier).state =
            //                           index;
            //                       final bytes =
            //                           await rootBundle.load(data[index]);
            //                       ref
            //                           .read(
            //                               listImageControllerProvider.notifier)
            //                           .splitImage(bytes.buffer.asUint8List(),
            //                               lengthMatrix);
            //                     },
            //                     child: SizedBox(
            //                       height: 150,
            //                       width: 150,
            //                       child: Image.asset(
            //                         data[index],
            //                         fit: BoxFit.cover,
            //                       ),
            //                     ),
            //                   );
            //                 });
            //           },
            //           error: (obj, stackTrade) => Text(stackTrade.toString()),
            //           loading: () => const CircularProgressIndicator());
            //     },
            //   ),
            // ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 230,
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  levels.pathAsset,
                  fit: BoxFit.cover,
                  height: 190,
                  width: 190,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(builder: (context, ref, child) {
                  final move = ref.watch(moveProvider);
                  return Row(
                    children: [
                      const Icon(FontAwesomeIcons.shoePrints, size: 16,),
                      const SizedBox(width: 8,),
                      Text('${levels.step - move}'),
                    ],
                  );
                }),
                const SizedBox(width: 64,),
                Consumer(builder: (context, ref, child) {
                  final timer = ref.watch(timerProvider(levels.time));
                  return Row(
                    children: [
                      const Icon(FontAwesomeIcons.stopwatch, size: 20,),
                      const SizedBox(width: 8,),
                      Text(secondsToMinutes(timer)),
                    ],
                  );
                }),
              ],
            ),
            const SizedBox(height: 16,),
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
                      : Stack(
                          children: [
                            GridView.builder(
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
                                      final neighborsWithValueZero = ref
                                          .read(listImageControllerProvider.notifier)
                                          .swapNeighborsWithValueZero([row, col]);

                                      if (neighborsWithValueZero.isNotEmpty) {
                                        if (ref.read(moveProvider.notifier).state == levels.step) {
                                          dev.log('fail');
                                          return;
                                        }
                                        // dev.log(ref.read(timerProvider(levels.time) as ProviderListenable<String>));
                                        if (ref.read(timerProvider(levels.time)) == 0) {
                                          dev.log('fail time');
                                          return;
                                        }
                                        if (ref.read(moveProvider.notifier).state == 0) {
                                          ref.read(timerProvider(levels.time).notifier).start();
                                        }

                                        ref.read(moveProvider.notifier).state += 1;
                                        ref
                                            .read(listImageControllerProvider.notifier)
                                            .swap(neighborsWithValueZero, [row, col]);
                                        if (ref.read(listImageControllerProvider.notifier).detectSuccess()) {
                                          dev.log('success');
                                          // ref.read(isSuccessProvider.notifier).state = true;
                                          ref.read(timerProvider(levels.time).notifier).stop();
                                          ref
                                              .read(levelsControllerProvider.notifier)
                                              .addLevels(levels.copyWith(finish: 3));
                                          ref.read(levelsControllerProvider.notifier).updateLevels();
                                        }
                                      } else {
                                        dev.log('wrong');
                                      }
                                    },
                                    child: Container(
                                        color: Colors.transparent,
                                        // child: Text('${listImage[index]}'));
                                        child: Stack(
                                          children: [
                                            Image.memory(listImage[row][col].unit8List!),
                                            Text(
                                              listImage[row][col].index.toString(),
                                              style: const TextStyle(color: Colors.yellow),
                                            ),
                                          ],
                                        )),
                                  );
                                }),
                            Align(
                              alignment: Alignment.topCenter,
                              child: ConfettiWidget(
                                confettiController: controllerCenter,
                                blastDirectionality:
                                    BlastDirectionality.explosive, // don't specify a direction, blast randomly
                                shouldLoop: true, // start again as soon as the animation is finished
                                colors: const [
                                  Colors.green,
                                  Colors.blue,
                                  Colors.pink,
                                  Colors.orange,
                                  Colors.purple
                                ], // manually specify the colors to be used
                                createParticlePath: drawStar, // define a custom shape/path.
                              ),
                            ),
                          ],
                        ));
            }),
            // Consumer(builder: (context, ref, child) {
            //   final lengthMatrix = ref.watch(lengthProvider);
            //   final selectingIndex = ref.watch(selectingProvider);
            //   final assets = ref.watch(assetsProvider);
            //   return SizedBox(
            //     // height: 70,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Slider(
            //             value: lengthMatrix.toDouble(),
            //             min: 2,
            //             max: 10,
            //             onChanged: (value) {
            //               ref.read(lengthProvider.notifier).state =
            //                   value.toInt();
            //             }),
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(lengthMatrix.toString()),
            //             TextButton(
            //               onPressed: () async {
            //                 final bytes = await rootBundle
            //                     .load(assets.value![selectingIndex]);
            //                 ref
            //                     .read(listImageControllerProvider.notifier)
            //                     .splitImage(
            //                         bytes.buffer.asUint8List(), lengthMatrix);
            //               },
            //               child: const Text('ok'),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   );
            // }),

            // TextButton(
            //     onPressed: () async {
            //       ref.read(timerProvider(levels.time).notifier).stop();
            //       ref.read(timerProvider(levels.time).notifier).reset();
            //       ref.read(moveProvider.notifier).state = 0;
            //       ref.read(listImageControllerProvider.notifier).convertAsset(levels.pathAsset, levels.matrix);
            //     },
            //     child: const Text('restart')),
            const SizedBox(height: 16,),
            InkWell(
              onTap: () async {
                ref.read(timerProvider(levels.time).notifier).stop();
                ref.read(timerProvider(levels.time).notifier).reset();
                ref.read(moveProvider.notifier).state = 0;
                ref.read(listImageControllerProvider.notifier).convertAsset(levels.pathAsset, levels.matrix);
              },
              child: Container(
                height: 50,
                width: 160,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SvgPicture.asset(
                      'assets/icons/restart.svg',
                      semanticsLabel: 'Acme Logo',
                    width: 45,
                  ),
                  const SizedBox(width: 8,),
                    const Text('Restart', style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
            ),
            // TextButton(
            //     onPressed: () async {
                  // print(levels.toString());
                  // ref.read(levelsControllerProvider.notifier).addLevels(levels.copyWith(finish: 2));
                  // ref.read(levelsControllerProvider.notifier).updateLevels();
                  // controllerCenter.play();
                // },
                // child: Text('confetti')),
            const Spacer(),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     width: 200,
            //     height: 50,
            //     color: Colors.red,
            //   ),
            // ),
            const SizedBox(height: 16,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Consumer(builder: (context, ref, child){
                final adController  = ref.watch(adControllerProvider);
                if (adController.anchoredAdaptiveAd != null &&
                    adController.isLoaded) {
                  final AdWidget adWidget = AdWidget(ad: adController.anchoredAdaptiveAd!);
                  return Container(
                  alignment: Alignment.center,
                  width: adController.anchoredAdaptiveAd!.size.width.toDouble(),
                  height: adController.anchoredAdaptiveAd!.size.height.toDouble(),
                  child:  adWidget,
                );
                }
                return const SizedBox();
              }),
            ),
          ],
        ),
      ),
    );
  }


}
