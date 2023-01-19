import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'levels.g.dart';
part 'levels.freezed.dart';


@freezed

class Levels with _$Levels  {
  @HiveType(typeId: 0, adapterName: 'LevelsAdapter')
  const factory Levels({
    @HiveField(0)
    required int difficulty,

    @HiveField(1)
    required int level,

    @HiveField(2)
    required int step,

    @HiveField(3)
    required int time,

    @HiveField(4)
    required String pathAsset,

    @HiveField(5)
    required int matrix,

    @HiveField(6)
    int? remainTime,

    @HiveField(7)
    @Default(0) int finish, //* 1 2 3 star *//


}) = _Levels;


  factory Levels.fromJson(Map<String, dynamic> json) =>
      _$LevelsFromJson(json);
}