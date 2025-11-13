import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeModeStorage {
  final String _key = 'theme_mode';
  final _box = GetStorage();

  // write mode to storage
  void write(ThemeMode mode) {
    _box.write(_key, mode.toString().split('.').last);
  }

  // read mode from storage
  ThemeMode read() {
    final mode = _box.read(_key);
    if (mode == 'dark') return ThemeMode.dark;
    if (mode == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }

  // remove mode from storage
  void remove() {
    _box.remove(_key);
  }
}
