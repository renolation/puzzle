


import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart';
import 'package:reno_puzzle/models/uint8list_converter.dart';
part 'puzzle.freezed.dart';
part 'puzzle.g.dart';

@freezed
class Puzzle with _$Puzzle{
  factory Puzzle({
    @Uint8ListConverter() required Uint8List? unit8List,
    required int index,
    @Default(false) bool isHide,

  }) = _Puzzle;

  factory Puzzle.fromJson(Map<String, dynamic> json) =>
      _$PuzzleFromJson(json);
}