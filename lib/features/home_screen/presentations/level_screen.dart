import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_puzzle/features/home_screen/data/levels_controller.dart';

import '../../../providers/providers.dart';
import '../../../utils/enums.dart';

class LevelScreen extends HookConsumerWidget {
  const LevelScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficulty = ref.watch(difficultyProvider);
    return Container(
        child: Column(
          children: [
            Text('level'),
            Text('$difficulty'),
            Row(
              children: [
                InkWell(
                  onTap: () => ref
                      .read(homeScreenTypeProvider.notifier)
                      .update((state) => HomeScreenState.difficulty),
                  child: Icon(Icons.arrow_left),
                ),

              ],
            ),
            Expanded(
              child: Consumer(builder: (context, ref, child){
                final data = ref.watch(levelsControllerProvider);
                print(data.length);
                return ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context, index){
                    return Text(' ${data[index].difficulty} : ${data[index].level}');
                    }
                );
              }),
            ),
          ],
        ));
  }
}