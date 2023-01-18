import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'levels.g.dart';
part 'levels.freezed.dart';

mixin IsarId {
  Id? get isarId;
}

@freezed
@Collection(accessor:'LevelsSchema',ignore: {'copyWith', 'id'})
class Levels with _$Levels, IsarId {
  const factory Levels({
    int? id,
    required int difficulty,
    required int level,
    required int step,
    required int time,
    required String pathAsset,
    required int matrix,
    int? remainTime,
    @Default(0) int finish, //* 1 2 3 star *//


}) = _Levels;

  const Levels._();

  @override
  Id? get isarId => id;

  factory Levels.fromJson(Map<String, dynamic> json) =>
      _$LevelsFromJson(json);
}