import 'package:aurora/App/Controllers/Auth/splash_controller.dart';
import 'package:aurora/App/Views/Global/Molecules/typewriter_text.dart';
import 'package:aurora/App/Views/Pages/Auth/Widgets/build_auth_apply_button.dart';
import 'package:aurora/Routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class BuildAuthHeroSection extends StatelessWidget {
  const BuildAuthHeroSection({super.key, required this.controller});

  final SplashController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TypewriterText(
            'Master the art of living.',
            initialDelay: 5000.ms,
            tickForSpaces: false,
            center: true,
            onTick: (i, ch) {
              controller.vibrateOnTypeClick();
            },
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            'The next generation lifestyle OS for post-exit & late-stage founders.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ).animate().fadeIn(delay: 7000.ms, duration: 1500.ms),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          BuildAuthApplyButton(onTap: () => Get.offAndToNamed(AppRoutes.HOME)),
        ],
      ),
    );
  }
}
