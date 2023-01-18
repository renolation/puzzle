import 'package:isar/isar.dart';
import 'package:reno_puzzle/features/home_screen/domains/levels.dart';

class IsarManager {
  const IsarManager(this.isar);

  final Isar isar;

  // Future<List<Levels>> watchLatestVersion() async* {
  //   final query = isar.LevelsSchema.where().build();
  //
  //   await for (final results in query.watch(fireImmediately: true)) {
  //     if (results.isNotEmpty) {
  //       yield results.first;
  //     }
  //   }
  // }
  Future<List<Levels>> getListDB() async {
    final query = isar.LevelsSchema.where().findAll();
    return query;

  }
}
