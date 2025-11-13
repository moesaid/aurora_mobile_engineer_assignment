import 'package:aurora/App/Controllers/Global/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppInitializer {
  static Future<void> initialize() async {
    // init GetStorage
    await GetStorage.init();

    // init theme controller to load saved theme mode
    Get.put(ThemeController(), permanent: true);
  }
}
