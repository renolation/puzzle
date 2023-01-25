import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../utils/enums.dart';

class DifficultyScreen extends HookConsumerWidget {
  const DifficultyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Text('diff'),
        Row(
          children: [
            InkWell(
              onTap: () => ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.main),
              child: const Icon(Icons.arrow_left),
            ),
            InkWell(
              onTap: () => ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level),
              child: const Icon(Icons.arrow_right),
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     TextButton(
        //         onPressed: () {
        //           print(Difficulty.hard.index);
        //           ref.read(difficultyProvider.notifier).state = Difficulty.easy.index + 1;
        //           ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
        //         },
        //         child: Text('easy')),
        //     TextButton(
        //         onPressed: () {
        //           ref.read(difficultyProvider.notifier).state = Difficulty.medium.index + 1;
        //           ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
        //         },
        //         child: Text('medium')),
        //     TextButton(
        //         onPressed: () {
        //           ref.read(difficultyProvider.notifier).state = Difficulty.hard.index + 1;
        //           ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
        //         },
        //         child: Text('hard')),
        //   ],
        // ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(difficultyProvider.notifier).state = Difficulty.easy.index + 1;
                    ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
                  },
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Center(
                      child: Text('Easy'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(difficultyProvider.notifier).state = Difficulty.medium.index + 1;
                    ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
                  },
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Center(
                      child: Text('Medium'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    ref.read(difficultyProvider.notifier).state = Difficulty.hard.index + 1;
                    ref.read(homeScreenTypeProvider.notifier).update((state) => HomeScreenState.level);
                  },
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Center(
                      child: Text('Hard'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
