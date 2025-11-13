import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFED8A1E)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Hellix-Medium',
    );
  }

  ThemeData darkThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFED8A1E)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Hellix-Medium',
    );
  }
}
