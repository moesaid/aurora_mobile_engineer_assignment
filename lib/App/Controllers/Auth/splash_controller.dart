import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class SplashController extends GetxController {
  static SplashController instance = Get.find<SplashController>();

  final player = AudioPlayer();

  @override
  void onInit() {
    _intCount();
    super.onInit();
  }

  Future<void> _intCount() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    Future.delayed(const Duration(microseconds: 100), () async {
      await player.setVolume(1);
      player.play(AssetSource('sounds/opening.mp3'));
    });
  }

  // vibrate on each type click
  Future<void> vibrateOnTypeClick() async {
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 20, amplitude: 255);
    }
  }
}
