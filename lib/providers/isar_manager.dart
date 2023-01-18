import 'package:isar/isar.dart';
import 'package:reno_puzzle/features/home_screen/domains/levels.dart';

class IsarManager {
  const IsarManager(this.isar);

  final Isar isar;
  void test(){}

  Future<List<Levels>> getListDB() async {
    final query = await isar.LevelsSchema.where().findAll();
    print('query ${query}');
    return query;
  }

  Future<void> insertLevels(Levels levels) async {
    print((levels.toString()));
    await isar.writeTxn(() async {
      await isar.LevelsSchema.put(levels);
    });
  }
}
