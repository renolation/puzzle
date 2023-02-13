import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_puzzle/features/home_screen/data/levels_controller.dart';

import '../../../providers/providers.dart';
import '../../../routing/app_router.dart';

class LevelScreen extends HookConsumerWidget {
  const LevelScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final difficulty = ref.watch(difficultyProvider);

    // Box<Levels> levelsHive = useState(Hive.box<Levels>(levelsBox)).value;

    return Column(
      children: [
        Expanded(
          child: Consumer(builder: (context, ref, child) {
            final data = ref.watch(levelsControllerProvider);
            return Container(
              // color: Colors.red,
              margin: const EdgeInsets.all(16),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 1,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        context.goNamed(
                            AppRoute.play.name,
                            extra: data[index]);
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SvgPicture.asset('assets/icons/level.svg',
                                semanticsLabel: 'Acme Logo'),
                          ),
                          Center(
                              child: Text(
                            '${data[index].level}',
                            style: const TextStyle(fontSize: 50),
                          )),
                        ],
                      ),
                    );
                  }),
            );
          }),
        ),
        const SizedBox(
          height: 32,
        ),
        // Container(
        //   height: 300,
        //   child: ValueListenableBuilder(
        //     valueListenable: levelsHive.listenable(),
        //     builder: (BuildContext context,Box<Levels> box, _){
        //       return ListView.builder(
        //           itemCount: box.values.length,
        //           itemBuilder: (context, index){
        //              Levels? levels = box.getAt(index);
        //              return   Text('difficulty ${levels!.difficulty} - level ${levels.level} - finish : ${levels.finish}');
        //
        //           }
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }
}
