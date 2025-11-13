import 'dart:math' as math;

import 'package:aurora/App/Views/Global/Organisms/build_image_loading_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class BuildImageCard extends StatelessWidget {
  const BuildImageCard({
    super.key,

    required this.size,
    this.duration = const Duration(seconds: 4),
    this.maxTilt = 0.08,
    this.scaleRange = 0.03,
    this.elevation = 18.0,
    this.continuous = false,
    required this.isLoading,
    required this.activeImageUrl,
    required this.setErrorState,
  });

  final double size;
  final Duration duration;
  final double maxTilt;
  final double scaleRange;
  final double elevation;
  final bool continuous, isLoading;
  final String activeImageUrl;
  final VoidCallback setErrorState;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(context.width * 0.03),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(80),
            blurRadius: 50,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(context.width * 0.02),
        child: AnimatedSwitcher(
          duration: 450.ms,
          switchInCurve: Curves.easeOutBack,
          switchOutCurve: Curves.easeIn,
          child: isLoading
              ? const BuildImageLoadingState(isLoading: true)
              : Image.network(
                  activeImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: context.width * 0.6,
                  cacheWidth: 800,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                        // fead in effect when image is loaded
                        if (wasSynchronouslyLoaded) {
                          return child;
                        }
                        return AnimatedOpacity(
                          opacity: frame == null ? 0 : 1,
                          duration: 800.ms,
                          curve: Curves.easeIn,
                          child: child,
                        );
                      },
                  errorBuilder: (_, __, ___) {
                    setErrorState.call();
                    return const BuildImageLoadingState(isError: true);
                  },
                ),
        ),
      ),
    );

    return card
        .animate()
        .fadeIn(duration: 400.ms, curve: Curves.easeIn)
        .then(delay: 500.ms)
        .animate(
          onPlay: (controller) => controller.repeat(reverse: !continuous),
        )
        .shimmer(
          duration: 3000.ms,
          curve: Curves.easeInOut,
          color: Colors.white.withAlpha(50),
        )
        .custom(
          duration: duration,
          // builder called each frame with value = 0..1
          builder: (context, value, child) {
            final t = value.clamp(0.0, 1.0);

            double tiltX, tiltY, scale;
            if (continuous) {
              // continuous: full Y rotation + slow X wobble
              final yAngle = (t * 2 * math.pi); // 0..2π
              tiltY = yAngle;
              tiltX = math.sin(t * 2 * math.pi * 0.5) * maxTilt;
              scale = 1.0 + math.sin(t * 2 * math.pi) * (scaleRange / 2);
            } else {
              // yoyo: t goes 0..1..0 (because controller.repeat(reverse:true))
              // map 0..1 to -1..1 for signed tilt
              final signed = (t * 2 - 1); // -1..1
              tiltX = -signed * maxTilt * 0.6;
              tiltY = signed * maxTilt;
              scale = 1.0 + math.sin(t * math.pi * 2) * (scaleRange / 2);
            }

            // Build 3D transform with perspective
            final matrix = Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.0016,
              ) // perspective; tweak if you want more depth
              ..rotateX(tiltX)
              ..rotateY(tiltY);

            // shadow variations based on tilt magnitude
            final tiltMagnitude = (tiltX.abs() + tiltY.abs()).clamp(0.0, 1.0);
            final shadowBlur = (elevation + tiltMagnitude * 60).clamp(
              4.0,
              60.0,
            );
            final shadowOffsetY = (6 + tiltMagnitude * 20).clamp(2.0, 40.0);
            final shadowOpacity = (0.28 + tiltMagnitude * 0.5).clamp(
              0.12,
              0.75,
            );

            return Transform(
              transform: matrix,
              alignment: Alignment.center,
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(
                          (shadowOpacity * 255).toInt(),
                        ),
                        blurRadius: shadowBlur,
                        offset: Offset(0, shadowOffsetY),
                        spreadRadius: -8,
                      ),
                    ],
                  ),
                  child: child,
                ),
              ),
            );
          },
        );
  }
}
