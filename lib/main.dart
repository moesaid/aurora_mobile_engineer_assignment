import 'package:aurora/Config/Bindings/app_binding.dart';
import 'package:aurora/Config/Exernal/app_initializer.dart';
import 'package:aurora/Config/Theme/app_theme.dart';
import 'package:aurora/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize services
  await AppInitializer.initialize();

  // runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aurora',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightThemeData(),
      darkTheme: AppTheme().darkThemeData(),
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialBinding: AppBinding(),
      getPages: AppPages.pages,
      defaultTransition: Transition.native,
    );
  }
}
