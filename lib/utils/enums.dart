import 'package:flutter/material.dart';

enum FontWeightEnum {

  w100('w100', FontWeight.w100),
  w200('w200', FontWeight.w200),
  w300('w300', FontWeight.w300),
  w400('w400', FontWeight.w400),
  w500('w500', FontWeight.w500),
  w600('w600', FontWeight.w600),
  w700('w700', FontWeight.w700),
  w800('w800', FontWeight.w800),
  w900('w900', FontWeight.w900);

  const FontWeightEnum(this.name, this.fontWeight);

  final String name;
  final FontWeight fontWeight;
}

enum FontStyleEnum {

  normal('normal', FontStyle.normal),
  italic('italic', FontStyle.italic);

  const FontStyleEnum(this.name, this.fontStyle);
  final String name;
  final FontStyle fontStyle;
}

enum Category{
  attitude('attitude'),
  birthday('birthday');
  const Category(this.name);
  final String name;
}

enum StyleTextEnum {
  fontFamily, height, color, backgroundColor, fontSize, fontWeight,
  fontStyle, letterSpacing, wordSpacing,
}


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
