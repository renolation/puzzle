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
      children: [
        Text('main'),
        Row(
          children: [
            InkWell(
              onTap: () => ref
                  .read(homeScreenTypeProvider.notifier)
                  .update((state) => HomeScreenState.difficulty),
              child: Icon(Icons.arrow_right),
            ),
          ],
        )
      ],
    ));
  }
}
