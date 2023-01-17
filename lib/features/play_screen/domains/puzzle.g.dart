// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'puzzle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Puzzle _$$_PuzzleFromJson(Map<String, dynamic> json) => _$_Puzzle(
      unit8List:
          const Uint8ListConverter().fromJson(json['unit8List'] as List<int>?),
      index: json['index'] as int,
      isHide: json['isHide'] as bool? ?? false,
    );

Map<String, dynamic> _$$_PuzzleToJson(_$_Puzzle instance) => <String, dynamic>{
      'unit8List': const Uint8ListConverter().toJson(instance.unit8List),
      'index': instance.index,
      'isHide': instance.isHide,
    };
