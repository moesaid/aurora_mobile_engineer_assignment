import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // toggle theme mode
  void toggleThemeMode() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
