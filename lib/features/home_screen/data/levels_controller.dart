
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:reno_puzzle/providers/providers.dart';

import '../../../main.dart';
import '../domains/levels.dart';
import 'levels_repository.dart';

final levelsControllerProvider =
StateNotifierProvider.autoDispose<LevelsController, List<Levels>>((ref) {
  final difficulty = ref.watch(difficultyProvider);
  print('diffi $difficulty');
  return LevelsController(levelsRepository: ref.read(levelsRepositoryProvider), difficulty: difficulty);
});

class LevelsController extends StateNotifier<List<Levels>> {

  LevelsController({required this.levelsRepository, required this.difficulty}) : super([]){
    getLocalLevels(difficulty);
  }
  final LevelsRepository levelsRepository;
  final int difficulty;

  getLocalLevels(int difficulty) async {
    await levelsRepository.fetchLevelsLocal(difficulty).then((value) async {
      var box = await Hive.openBox<Levels>(levelsBox);
      var secondList =  box.values.toList();
      // print(secondList.toString());
      final firstList = value.map((e) =>
          secondList.firstWhere((element) {
            if(e.difficulty == element.difficulty && e.level == element.level){
              return true;
            }
            return false;
          }, orElse: () => e)
      ).toList();
      print(firstList.length);
      return state = [...firstList, ];
    });
  }

  addLevels(Levels levels) async {
    var box = await Hive.openBox<Levels>(levelsBox);
    String key = '${levels.difficulty}.${levels.level}';
    box.put(key, levels);
  }

  updateLevels() async {
    print('update');
    var box = await Hive.openBox<Levels>(levelsBox);
    var secondList =  box.values.toList();
    List<Levels> firstList = state;
     firstList = firstList.map((e) =>
        secondList.firstWhere((element) {
          if(e.difficulty == element.difficulty && e.level == element.level){
            return true;
          }
          return false;
        }, orElse: () => e)
    ).toList();
     print(firstList);

    state = [...firstList,];
    print('done');
  }


}