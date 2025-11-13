import 'package:aurora/App/Views/Pages/Auth/splash_page.dart';
import 'package:aurora/App/Views/Pages/Home/home_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.SPLASH, page: () => const SplashPage()),
    GetPage(name: AppRoutes.HOME, page: () => const HomePage()),
  ];
}
