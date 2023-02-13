import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_puzzle/features/home_screen/data/levels_controller.dart';
import '../../../services/ad_controller.dart';

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
                        if( (data[index].level == 1 && data[index].difficulty == 1) ||
                            (index > 0 && data[index -1].finish != 0)){

                          if(ref.read(playTimeProvider.notifier).state % 3 == 0 && ref.read(playTimeProvider.notifier).state > 0){
                            ref.read(adControllerProvider.notifier).showInterstitialAd();
                          }
                          ref.read(playTimeProvider.notifier).state++;
                          context.goNamed(
                              AppRoute.play.name,
                              extra: data[index]);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You needs to complete last level')));
                        }
                       
                      },
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SvgPicture.asset('assets/icons/level.svg',
                                semanticsLabel: 'Acme Logo'),
                          ),
                          // Center(
                          //   child: Text('${data[index].level} ${data[index].finish} '),
                          // ),

                          (data[index].level == 1 && data[index].difficulty == 1) ||
                              (index > 0 && data[index -1].finish != 0)
                          ? Center(child: Text('${data[index].level}', style: const TextStyle(fontSize: 50),))
                          :const Center(child: Icon(FontAwesomeIcons.lock, color: Colors.yellow, size: 36,)),

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
