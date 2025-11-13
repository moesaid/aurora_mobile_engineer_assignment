import 'package:aurora/App/Controllers/Global/theme_controller.dart';
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
    return Obx(
      () => GetMaterialApp(
        title: 'Aurora',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().lightThemeData(),
        darkTheme: AppTheme().darkThemeData(),
        themeMode: ThemeController.instance.themeMode,
        initialBinding: AppBinding(),
        getPages: AppPages.pages,
        initialRoute: AppRoutes.SPLASH,
        defaultTransition: Transition.native,
      ),
    );
  }
}
