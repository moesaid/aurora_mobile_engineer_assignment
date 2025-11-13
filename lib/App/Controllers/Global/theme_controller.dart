import 'package:aurora/Storage/theme_mode_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find<ThemeController>();

  final themeModeStorage = ThemeModeStorage();

  final _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;

  @override
  void onInit() {
    _intController();
    super.onInit();
  }

  Future<void> _intController() async {
    // load saved theme mode from storage
    final savedMode = themeModeStorage.read();
    _themeMode.value = savedMode;
    Get.changeThemeMode(savedMode);
  }

  // toggle theme mode
  void toggleThemeMode() {
    print('Toggling theme mode from ${_themeMode.value}');

    if (_themeMode.value == ThemeMode.dark) {
      Get.changeThemeMode(ThemeMode.light);
      themeModeStorage.write(ThemeMode.light);
      _themeMode.value = ThemeMode.light;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      themeModeStorage.write(ThemeMode.dark);
      _themeMode.value = ThemeMode.dark;
    }

    update();

    print('Theme mode changed to ${_themeMode.value}');
  }
}
