
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reno_puzzle/providers/isar_manager.dart';
import 'package:reno_puzzle/providers/providers.dart';

import '../domains/levels.dart';
import 'levels_repository.dart';

final levelsControllerProvider =
StateNotifierProvider.autoDispose<LevelsController, List<Levels>>((ref) {
  final isarManager = ref.read(isarManagerPod);
  return LevelsController(levelsRepository: ref.read(levelsRepositoryProvider), isarManager: isarManager);
});

class LevelsController extends StateNotifier<List<Levels>> {

  LevelsController({required this.levelsRepository,required this.isarManager}) : super([]){
    getLocalLevels();
  }
  final LevelsRepository levelsRepository;
  final IsarManager isarManager;
  
  getLocalLevels() async {
    await levelsRepository.fetchLevelsLocal().then((value) async {
      final secondList = await isarManager.getListDB();

      print(secondList.toString());
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

  updateLevels() async {
    print('update');
    final secondList = await isarManager.getListDB();

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