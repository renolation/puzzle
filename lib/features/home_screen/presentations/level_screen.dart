import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_puzzle/features/home_screen/data/levels_controller.dart';

import '../../../main.dart';
import '../../../providers/providers.dart';
import '../../../routing/app_router.dart';
import '../../../utils/enums.dart';
import '../domains/levels.dart';

class LevelScreen extends HookConsumerWidget {
  const LevelScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficulty = ref.watch(difficultyProvider);

    Box<Levels> levelsHive = useState(Hive.box<Levels>(levelsBox)).value;


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
                return ListView.builder(
                  itemCount: data.length,
                    itemBuilder: (context, index){
                    return GestureDetector(
                        onTap: (){

                          context.goNamed(
                              AppRoute.play.name,
                          extra: data[index]);
                        },
                        child: Container(
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: data[index].finish == 0 ? Colors.red : Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(child: Text('difficulty ${data[index].difficulty} - level ${data[index].level} - finish : ${data[index].finish}'))));
                    }
                );
              }),
            ),
            Text('done'),
            Container(
              height: 300,
              child: ValueListenableBuilder(
                valueListenable: levelsHive.listenable(),
                builder: (BuildContext context,Box<Levels> box, _){
                  return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index){
                         Levels? levels = box.getAt(index);
                         return   Text('difficulty ${levels!.difficulty} - level ${levels.level} - finish : ${levels.finish}');

                      }
                  );
                },
              ),
            ),
          ],
        ));
  }
}
