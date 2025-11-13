import 'package:aurora/App/Views/Global/Atoms/build_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BuildLogoOrbit extends StatelessWidget {
  const BuildLogoOrbit({
    super.key,
    this.intro = const Duration(milliseconds: 900),
    this.flip1 = const Duration(milliseconds: 520),
    this.flip2 = const Duration(milliseconds: 620),
    this.initialScale,
    this.finalScale,
    this.initialDelay,
    this.startColor,
    this.endColor,
    this.delayBeforeLastScale,
  });

  final Duration? intro, flip1, flip2, initialDelay, delayBeforeLastScale;
  final double? initialScale, finalScale;
  final Color? startColor, endColor;

  @override
  Widget build(BuildContext context) {
    return const BuildLogo()
        .animate(delay: initialDelay)
        .custom(
          duration: 5000.ms,
          builder: (context, value, child) {
            return BuildLogo(color: Color.lerp(startColor, endColor, value));
          },
        )
        .fadeIn(duration: intro, curve: Curves.easeInExpo)
        .scale(
          begin: Offset.zero,
          end: Offset(initialScale ?? 1.5, initialScale ?? 1.5),
          duration: intro,
          curve: Curves.easeOutCubic,
        )
        .blur(
          begin: const Offset(10, 10),
          end: Offset.zero,
          duration: intro,
          curve: Curves.easeOut,
        )
        .then()
        .flipH(
          begin: 0.0,
          end: 1,
          alignment: Alignment.center,
          perspective: 0.004,
          duration: flip1,
          curve: Curves.easeInOutCubic,
        )
        .then()
        .flipV(
          begin: 0.0,
          end: 1,
          alignment: Alignment.center,
          perspective: 0.004,
          duration: flip2,
          curve: Curves.easeInOutCubic,
        )
        .scale(
          delay: delayBeforeLastScale,
          begin: Offset(initialScale ?? 1.5, initialScale ?? 1.5),
          end: Offset(finalScale ?? 2, finalScale ?? 2),
          duration: 500.ms,
          curve: Curves.easeInOutCubic,
        );
  }
}
