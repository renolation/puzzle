import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../utils/enums.dart';
import 'difficulty_screen.dart';
import 'home_screen.dart';
import 'level_screen.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('main'),
        Row(
          children: [
            InkWell(
              onTap: () => ref
                  .read(homeScreenTypeProvider.notifier)
                  .update((state) => HomeScreenState.difficulty),
              child: Icon(Icons.arrow_right),
            ),
          ],
        ),
        // TextButton(onPressed: (){
        //   ref
        //       .read(homeScreenTypeProvider.notifier)
        //       .update((state) => HomeScreenState.difficulty);
        // }, child: Text('play')),
        InkWell(
          onTap: () => ref
              .read(homeScreenTypeProvider.notifier)
              .update((state) => HomeScreenState.difficulty),
          child: Container(
            width: 200,
            height: 100,
            color: Colors.yellow,
            child: const Center(
              child: Text('Play'),
            ),
          ),
        ),
      ],
    ));
  }
}
