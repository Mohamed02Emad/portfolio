import 'dart:math' as math;

import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Get the shade of the color
  Color swatchShade(int swatchValue) => HSLColor.fromColor(this)
      .withLightness(1 - ((math.min(swatchValue, 1000)) / 1000))
      .toColor();

  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
