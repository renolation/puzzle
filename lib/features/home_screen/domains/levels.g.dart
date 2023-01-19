// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LevelsAdapter extends TypeAdapter<_$_Levels> {
  @override
  final int typeId = 0;

  @override
  _$_Levels read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Levels(
      difficulty: fields[0] as int,
      level: fields[1] as int,
      step: fields[2] as int,
      time: fields[3] as int,
      pathAsset: fields[4] as String,
      matrix: fields[5] as int,
      remainTime: fields[6] as int?,
      finish: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Levels obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.difficulty)
      ..writeByte(1)
      ..write(obj.level)
      ..writeByte(2)
      ..write(obj.step)
      ..writeByte(3)
      ..write(obj.time)
      ..writeByte(4)
      ..write(obj.pathAsset)
      ..writeByte(5)
      ..write(obj.matrix)
      ..writeByte(6)
      ..write(obj.remainTime)
      ..writeByte(7)
      ..write(obj.finish);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
