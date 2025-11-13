import 'package:flutter/material.dart';

class ColorHelper {
  /// Lighten a color by [amount] (0.0–1.0)
  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final light = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(light).toColor();
  }

  /// Darken a color by [amount] (0.0–1.0)
  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final light = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(light).toColor();
  }
}
