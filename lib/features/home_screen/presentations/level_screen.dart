import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/providers.dart';
import '../../../utils/enums.dart';

class LevelScreen extends HookConsumerWidget {
  const LevelScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Column(
          children: [
            Text('level'),
            Row(
              children: [
                InkWell(
                  onTap: () => ref
                      .read(homeScreenTypeProvider.notifier)
                      .update((state) => HomeScreenState.difficulty),
                  child: Icon(Icons.arrow_left),
                ),

              ],
            )
          ],
        ));
  }
}
