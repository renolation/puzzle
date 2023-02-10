import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_puzzle/features/home_screen/presentations/main_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../providers/providers.dart';
import '../../../services/ad_controller.dart';
import '../../../utils/enums.dart';
import 'difficulty_screen.dart';
import 'level_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    useEffect(
          () {
        ref.read(adControllerProvider.notifier).createInterstitialAd();
        return null;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Puzzle'),
        backgroundColor: const Color(0xff55CCD5),
      ),
      body: Container(
        color: const Color(0xff55CCD5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20,bottom: 4),
                child: Consumer(builder: (context, ref, child) {
                  final homeScreenType = ref.watch(homeScreenTypeProvider);
                  switch(homeScreenType){
                    case HomeScreenState.main:
                      return const MainScreen();
                      break;
                    case HomeScreenState.difficulty:
                      return const DifficultyScreen();
                      break;
                    case HomeScreenState.level:
                      return const LevelScreen();
                      break;
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
