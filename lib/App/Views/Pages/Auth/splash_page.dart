import 'package:aurora/App/Controllers/Auth/splash_controller.dart';
import 'package:aurora/App/Views/Global/Organisms/build_full_logo_animation.dart';
import 'package:aurora/App/Views/Pages/Auth/Widgets/build_auth_background.dart';
import 'package:aurora/App/Views/Pages/Auth/Widgets/build_auth_hero_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Background image
                  const BuildAuthBackground(), // first fade in
                  // Full Logo Animation
                  const BuildFullLogoAnimation().animate().fadeOut(
                    delay: 4000.ms,
                    duration: 1000.ms,
                  ),
                  // Hero Section
                  BuildAuthHeroSection(controller: controller),
                  // fotter logo
                  Positioned(
                    bottom: 50,
                    left: 50,
                    right: 50,
                    child: SvgPicture.asset(
                      'assets/svgs/aurora-logo.svg',
                      width: MediaQuery.of(context).size.width,
                    ),
                  ).animate().fadeIn(delay: 2000.ms, duration: 1500.ms),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
