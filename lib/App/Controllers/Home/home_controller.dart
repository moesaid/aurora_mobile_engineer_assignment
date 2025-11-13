import 'package:aurora/App/Services/image_services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ImageServices _imageServices = ImageServices();

  @override
  Future<void> onInit() async {
    await _intController();
    super.onInit();
  }

  Future<void> _intController() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  // fetch random image
  Future<void> fetchRandomImage() async {
    final String? res = await _imageServices.getRandomImage();
    if (res == null || res.isEmpty) return;

    print('Random Image URL: $res');
  }
}
