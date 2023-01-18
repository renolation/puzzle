// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Levels _$$_LevelsFromJson(Map<String, dynamic> json) => _$_Levels(
      difficulty: json['difficulty'] as int,
      level: json['level'] as int,
      step: json['step'] as int,
      time: json['time'] as int,
      pathAsset: json['pathAsset'] as String,
      matrix: json['matrix'] as int,
      remainTime: json['remainTime'] as int?,
      finish: json['finish'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LevelsToJson(_$_Levels instance) => <String, dynamic>{
      'difficulty': instance.difficulty,
      'level': instance.level,
      'step': instance.step,
      'time': instance.time,
      'pathAsset': instance.pathAsset,
      'matrix': instance.matrix,
      'remainTime': instance.remainTime,
      'finish': instance.finish,
    };
