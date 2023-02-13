import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../features/home_screen/domains/levels.dart';
import '../utils/enums.dart';

final homeScreenTypeProvider = StateProvider<HomeScreenState>((ref) => HomeScreenState.main);

final difficultyProvider = StateProvider<int>((ref) => 1);
final playTimeProvider = StateProvider<int>((ref) => 0);
final isSuccessProvider = StateProvider<bool>((ref) => false);


final lengthProvider = StateProvider.autoDispose<int>((ref) {
  return 4;
});
final selectingProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final moveProvider = StateProvider.autoDispose<int>((ref) => 0);






