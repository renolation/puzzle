import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../../utils/dio_provider.dart';
final levelsApiProvider = Provider.autoDispose<LevelsApi>((ref) =>
    LevelsApi(client: ref.watch(dioProvider))
);

class LevelsApi {

  LevelsApi({required this.client});

  final Dio client;


  Future<Map<String, dynamic>> fetchLevels({required int id, CancelToken? cancelToken}) async {

    final response = await client.get('url');
    return response.data;
  }



}