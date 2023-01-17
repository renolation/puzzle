// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'puzzle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Puzzle _$PuzzleFromJson(Map<String, dynamic> json) {
  return _Puzzle.fromJson(json);
}

/// @nodoc
mixin _$Puzzle {
  @Uint8ListConverter()
  Uint8List? get unit8List => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  bool get isHide => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PuzzleCopyWith<Puzzle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PuzzleCopyWith<$Res> {
  factory $PuzzleCopyWith(Puzzle value, $Res Function(Puzzle) then) =
      _$PuzzleCopyWithImpl<$Res, Puzzle>;
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? unit8List, int index, bool isHide});
}

/// @nodoc
class _$PuzzleCopyWithImpl<$Res, $Val extends Puzzle>
    implements $PuzzleCopyWith<$Res> {
  _$PuzzleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit8List = freezed,
    Object? index = null,
    Object? isHide = null,
  }) {
    return _then(_value.copyWith(
      unit8List: freezed == unit8List
          ? _value.unit8List
          : unit8List // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isHide: null == isHide
          ? _value.isHide
          : isHide // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PuzzleCopyWith<$Res> implements $PuzzleCopyWith<$Res> {
  factory _$$_PuzzleCopyWith(_$_Puzzle value, $Res Function(_$_Puzzle) then) =
      __$$_PuzzleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? unit8List, int index, bool isHide});
}

/// @nodoc
class __$$_PuzzleCopyWithImpl<$Res>
    extends _$PuzzleCopyWithImpl<$Res, _$_Puzzle>
    implements _$$_PuzzleCopyWith<$Res> {
  __$$_PuzzleCopyWithImpl(_$_Puzzle _value, $Res Function(_$_Puzzle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit8List = freezed,
    Object? index = null,
    Object? isHide = null,
  }) {
    return _then(_$_Puzzle(
      unit8List: freezed == unit8List
          ? _value.unit8List
          : unit8List // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isHide: null == isHide
          ? _value.isHide
          : isHide // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Puzzle implements _Puzzle {
  _$_Puzzle(
      {@Uint8ListConverter() required this.unit8List,
      required this.index,
      this.isHide = false});

  factory _$_Puzzle.fromJson(Map<String, dynamic> json) =>
      _$$_PuzzleFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List? unit8List;
  @override
  final int index;
  @override
  @JsonKey()
  final bool isHide;

  @override
  String toString() {
    return 'Puzzle(unit8List: $unit8List, index: $index, isHide: $isHide)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Puzzle &&
            const DeepCollectionEquality().equals(other.unit8List, unit8List) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isHide, isHide) || other.isHide == isHide));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(unit8List), index, isHide);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PuzzleCopyWith<_$_Puzzle> get copyWith =>
      __$$_PuzzleCopyWithImpl<_$_Puzzle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PuzzleToJson(
      this,
    );
  }
}

abstract class _Puzzle implements Puzzle {
  factory _Puzzle(
      {@Uint8ListConverter() required final Uint8List? unit8List,
      required final int index,
      final bool isHide}) = _$_Puzzle;

  factory _Puzzle.fromJson(Map<String, dynamic> json) = _$_Puzzle.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List? get unit8List;
  @override
  int get index;
  @override
  bool get isHide;
  @override
  @JsonKey(ignore: true)
  _$$_PuzzleCopyWith<_$_Puzzle> get copyWith =>
      throw _privateConstructorUsedError;
}
