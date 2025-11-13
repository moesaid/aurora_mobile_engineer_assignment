import 'package:aurora/App/Controllers/Auth/splash_controller.dart';
import 'package:aurora/App/Controllers/Global/theme_controller.dart';
import 'package:aurora/App/Controllers/Home/home_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..put<ThemeController>(ThemeController(), permanent: true)
      ..lazyPut<SplashController>(() => SplashController())
      ..lazyPut<HomeController>(() => HomeController());
  }
}
