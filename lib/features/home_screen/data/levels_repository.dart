import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reno_puzzle/utils/data.dart';
import 'dart:developer' as dev;
import '../domains/levels.dart';
import 'levels_api.dart';

final levelsRepositoryProvider = Provider.autoDispose<LevelsRepository>((ref) =>LevelsRepository(levelsApi: ref.watch(levelsApiProvider)));

class LevelsRepository {
  LevelsRepository({ required this.levelsApi});

  LevelsApi levelsApi;

  Future<Levels> fetchLevelsOnline({required int id, CancelToken? cancelToken}) async {
    try {
      final res = await levelsApi.fetchLevels(id: id, cancelToken: cancelToken);
      final levels = Levels.fromJson(res);
      return levels;
    }
    on DioError catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }
  Future<List<Levels>> fetchLevelsLocal() async {
    try {
      return listLevels;
    }
    on DioError catch (e) {
      dev.log(e.toString());
      rethrow;
    }
  }

}
