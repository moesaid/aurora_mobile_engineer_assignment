import 'package:aurora/App/Views/Global/Molecules/build_logo_orbit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BuildFullLogoAnimation extends StatelessWidget {
  const BuildFullLogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // first orbit
        BuildLogoOrbit(
              initialDelay: 500.ms,
              initialScale: 0.5,
              finalScale: 4,
              flip1: 300.ms,
              flip2: 500.ms,
              delayBeforeLastScale: 200.ms,
              startColor: Colors.white.withAlpha(50),
              endColor: Colors.white,
            )
            .animate(delay: 300.ms)
            .scale(
              begin: const Offset(0.5, 0.5),
              end: const Offset(1.5, 1.5),
              duration: 2500.ms,
              curve: Curves.easeInOut,
            ),
        // second orbit
        BuildLogoOrbit(
              initialDelay: 300.ms,
              initialScale: 1,
              flip1: 600.ms,
              flip2: 700.ms,
              delayBeforeLastScale: 100.ms,
              startColor: Colors.white.withAlpha(50),
              endColor: Colors.white,
            )
            .animate(delay: 600.ms)
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(1.5, 1.5),
              duration: 2000.ms,
              curve: Curves.easeInOut,
            ),
        // main logo
        const BuildLogoOrbit(startColor: Colors.white, endColor: Colors.white),
      ],
    );
  }
}
