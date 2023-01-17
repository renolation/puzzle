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
  int get difficulty => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  int? get remainTime => throw _privateConstructorUsedError;
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
      {int difficulty,
      int level,
      int step,
      int time,
      int? remainTime,
      int finish});
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
      {int difficulty,
      int level,
      int step,
      int time,
      int? remainTime,
      int finish});
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
@Entity(realClass: Levels)
class _$_Levels implements _Levels {
  _$_Levels(
      {required this.difficulty,
      required this.level,
      required this.step,
      required this.time,
      this.remainTime,
      this.finish = 0});

  factory _$_Levels.fromJson(Map<String, dynamic> json) =>
      _$$_LevelsFromJson(json);

  @override
  final int difficulty;
  @override
  final int level;
  @override
  final int step;
  @override
  final int time;
  @override
  final int? remainTime;
  @override
  @JsonKey()
  final int finish;

  @override
  String toString() {
    return 'Levels(difficulty: $difficulty, level: $level, step: $step, time: $time, remainTime: $remainTime, finish: $finish)';
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
            (identical(other.remainTime, remainTime) ||
                other.remainTime == remainTime) &&
            (identical(other.finish, finish) || other.finish == finish));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, difficulty, level, step, time, remainTime, finish);

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
  factory _Levels(
      {required final int difficulty,
      required final int level,
      required final int step,
      required final int time,
      final int? remainTime,
      final int finish}) = _$_Levels;

  factory _Levels.fromJson(Map<String, dynamic> json) = _$_Levels.fromJson;

  @override
  int get difficulty;
  @override
  int get level;
  @override
  int get step;
  @override
  int get time;
  @override
  int? get remainTime;
  @override
  int get finish;
  @override
  @JsonKey(ignore: true)
  _$$_LevelsCopyWith<_$_Levels> get copyWith =>
      throw _privateConstructorUsedError;
}
