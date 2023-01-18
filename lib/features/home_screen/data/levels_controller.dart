
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domains/levels.dart';
import 'levels_repository.dart';

final levelsControllerProvider =
StateNotifierProvider.autoDispose<LevelsController, List<Levels>>((ref) {
  return LevelsController(levelsRepository: ref.read(levelsRepositoryProvider));
});

class LevelsController extends StateNotifier<List<Levels>> {

  LevelsController({required this.levelsRepository}) : super([]){
    getLocalLevels();
  }
  final LevelsRepository levelsRepository;
  
  getLocalLevels() async {
    await levelsRepository.fetchLevelsLocal().then((value) => state = [...value, ]);
  }
}