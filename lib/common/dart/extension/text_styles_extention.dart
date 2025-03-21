import 'package:flutter/painting.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get s8 => copyWith(fontSize: 8);

  TextStyle get s9 => copyWith(fontSize: 9);

  TextStyle get s10 => copyWith(fontSize: 10);

  TextStyle get s11 => copyWith(fontSize: 11);

  TextStyle get s12 => copyWith(fontSize: 12);

  TextStyle get s13 => copyWith(fontSize: 13);

  TextStyle get s14 => copyWith(fontSize: 14);

  TextStyle get s15 => copyWith(fontSize: 15);

  TextStyle get s16 => copyWith(fontSize: 16);

  TextStyle get s17 => copyWith(fontSize: 17);

  TextStyle get s18 => copyWith(fontSize: 18);

  TextStyle get s19 => copyWith(fontSize: 19);

  TextStyle get s20 => copyWith(fontSize: 20);

  TextStyle get s21 => copyWith(fontSize: 21);

  TextStyle get s22 => copyWith(fontSize: 22);

  TextStyle get s23 => copyWith(fontSize: 23);

  TextStyle get s24 => copyWith(fontSize: 24);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle setColor(Color color) => copyWith(color: color);
}
