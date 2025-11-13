import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    await _intController();
    super.onInit();
  }

  Future<void> _intController() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}
