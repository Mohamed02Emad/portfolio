import 'package:flutter/material.dart';

import '../resources/gen/fonts.gen.dart';
import 'color/app_colors.dart';

ThemeData get customTheme => ThemeData(
      textTheme: TextTheme(
        bodyLarge: _appTextStyle,
        bodyMedium: _appTextStyle,
        bodySmall: _appTextStyle,
      ),
      scaffoldBackgroundColor: AppColors.background,
    );

TextStyle get _appTextStyle =>
    TextStyle(color: AppColors.text, fontFamily: FontFamily.tajawal);
