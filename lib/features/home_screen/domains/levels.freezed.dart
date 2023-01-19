// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'levels.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Levels _$LevelsFromJson(Map<String, dynamic> json) {
  return _Levels.fromJson(json);
}

/// @nodoc
mixin _$Levels {
  @HiveField(0)
  int get difficulty => throw _privateConstructorUsedError;
  @HiveField(1)
  int get level => throw _privateConstructorUsedError;
  @HiveField(2)
  int get step => throw _privateConstructorUsedError;
  @HiveField(3)
  int get time => throw _privateConstructorUsedError;
  @HiveField(4)
  String get pathAsset => throw _privateConstructorUsedError;
  @HiveField(5)
  int get matrix => throw _privateConstructorUsedError;
  @HiveField(6)
  int? get remainTime => throw _privateConstructorUsedError;
  @HiveField(7)
  int get finish => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LevelsCopyWith<Levels> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LevelsCopyWith<$Res> {
  factory $LevelsCopyWith(Levels value, $Res Function(Levels) then) =
      _$LevelsCopyWithImpl<$Res, Levels>;
  @useResult
  $Res call(
      {@HiveField(0) int difficulty,
      @HiveField(1) int level,
      @HiveField(2) int step,
      @HiveField(3) int time,
      @HiveField(4) String pathAsset,
      @HiveField(5) int matrix,
      @HiveField(6) int? remainTime,
      @HiveField(7) int finish});
}

/// @nodoc
class _$LevelsCopyWithImpl<$Res, $Val extends Levels>
    implements $LevelsCopyWith<$Res> {
  _$LevelsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? level = null,
    Object? step = null,
    Object? time = null,
    Object? pathAsset = null,
    Object? matrix = null,
    Object? remainTime = freezed,
    Object? finish = null,
  }) {
    return _then(_value.copyWith(
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      pathAsset: null == pathAsset
          ? _value.pathAsset
          : pathAsset // ignore: cast_nullable_to_non_nullable
              as String,
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as int,
      remainTime: freezed == remainTime
          ? _value.remainTime
          : remainTime // ignore: cast_nullable_to_non_nullable
              as int?,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LevelsCopyWith<$Res> implements $LevelsCopyWith<$Res> {
  factory _$$_LevelsCopyWith(_$_Levels value, $Res Function(_$_Levels) then) =
      __$$_LevelsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int difficulty,
      @HiveField(1) int level,
      @HiveField(2) int step,
      @HiveField(3) int time,
      @HiveField(4) String pathAsset,
      @HiveField(5) int matrix,
      @HiveField(6) int? remainTime,
      @HiveField(7) int finish});
}

/// @nodoc
class __$$_LevelsCopyWithImpl<$Res>
    extends _$LevelsCopyWithImpl<$Res, _$_Levels>
    implements _$$_LevelsCopyWith<$Res> {
  __$$_LevelsCopyWithImpl(_$_Levels _value, $Res Function(_$_Levels) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? difficulty = null,
    Object? level = null,
    Object? step = null,
    Object? time = null,
    Object? pathAsset = null,
    Object? matrix = null,
    Object? remainTime = freezed,
    Object? finish = null,
  }) {
    return _then(_$_Levels(
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      pathAsset: null == pathAsset
          ? _value.pathAsset
          : pathAsset // ignore: cast_nullable_to_non_nullable
              as String,
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as int,
      remainTime: freezed == remainTime
          ? _value.remainTime
          : remainTime // ignore: cast_nullable_to_non_nullable
              as int?,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'LevelsAdapter')
class _$_Levels implements _Levels {
  const _$_Levels(
      {@HiveField(0) required this.difficulty,
      @HiveField(1) required this.level,
      @HiveField(2) required this.step,
      @HiveField(3) required this.time,
      @HiveField(4) required this.pathAsset,
      @HiveField(5) required this.matrix,
      @HiveField(6) this.remainTime,
      @HiveField(7) this.finish = 0});

  factory _$_Levels.fromJson(Map<String, dynamic> json) =>
      _$$_LevelsFromJson(json);

  @override
  @HiveField(0)
  final int difficulty;
  @override
  @HiveField(1)
  final int level;
  @override
  @HiveField(2)
  final int step;
  @override
  @HiveField(3)
  final int time;
  @override
  @HiveField(4)
  final String pathAsset;
  @override
  @HiveField(5)
  final int matrix;
  @override
  @HiveField(6)
  final int? remainTime;
  @override
  @JsonKey()
  @HiveField(7)
  final int finish;

  @override
  String toString() {
    return 'Levels(difficulty: $difficulty, level: $level, step: $step, time: $time, pathAsset: $pathAsset, matrix: $matrix, remainTime: $remainTime, finish: $finish)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Levels &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.pathAsset, pathAsset) ||
                other.pathAsset == pathAsset) &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.remainTime, remainTime) ||
                other.remainTime == remainTime) &&
            (identical(other.finish, finish) || other.finish == finish));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, difficulty, level, step, time,
      pathAsset, matrix, remainTime, finish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LevelsCopyWith<_$_Levels> get copyWith =>
      __$$_LevelsCopyWithImpl<_$_Levels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LevelsToJson(
      this,
    );
  }
}

abstract class _Levels implements Levels {
  const factory _Levels(
      {@HiveField(0) required final int difficulty,
      @HiveField(1) required final int level,
      @HiveField(2) required final int step,
      @HiveField(3) required final int time,
      @HiveField(4) required final String pathAsset,
      @HiveField(5) required final int matrix,
      @HiveField(6) final int? remainTime,
      @HiveField(7) final int finish}) = _$_Levels;

  factory _Levels.fromJson(Map<String, dynamic> json) = _$_Levels.fromJson;

  @override
  @HiveField(0)
  int get difficulty;
  @override
  @HiveField(1)
  int get level;
  @override
  @HiveField(2)
  int get step;
  @override
  @HiveField(3)
  int get time;
  @override
  @HiveField(4)
  String get pathAsset;
  @override
  @HiveField(5)
  int get matrix;
  @override
  @HiveField(6)
  int? get remainTime;
  @override
  @HiveField(7)
  int get finish;
  @override
  @JsonKey(ignore: true)
  _$$_LevelsCopyWith<_$_Levels> get copyWith =>
      throw _privateConstructorUsedError;
}
