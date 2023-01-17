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
    return Container(
        child: Column(
          children: [
            Text('diff'),
            Row(
              children: [
                InkWell(
                  onTap: () => ref
                      .read(homeScreenTypeProvider.notifier)
                      .update((state) => HomeScreenState.main),
                  child: Icon(Icons.arrow_left),
                ),
                InkWell(
                  onTap: () => ref
                      .read(homeScreenTypeProvider.notifier)
                      .update((state) => HomeScreenState.level),
                  child: Icon(Icons.arrow_right),
                ),
              ],
            )
          ],
        ));
  }
}
