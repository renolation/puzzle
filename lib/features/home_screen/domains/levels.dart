import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'levels.freezed.dart';
part 'levels.g.dart';

@freezed
class Levels with _$Levels {
  @Entity(realClass: Levels)
  factory Levels({
    required int difficulty,
    required int level,
    required int step,
    required int time,
    int? remainTime,
    @Default(0) int finish, //* 1 2 3 star *//


}) = _Levels;

  factory Levels.fromJson(Map<String, dynamic> json) =>
      _$LevelsFromJson(json);
}