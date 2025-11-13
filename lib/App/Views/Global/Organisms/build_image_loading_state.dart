import 'package:aurora/App/Views/Global/Atoms/build_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class BuildImageLoadingState extends StatelessWidget {
  const BuildImageLoadingState({super.key, this.isError, this.isLoading});

  final bool? isError, isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          duration: 800.ms,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildLogo(size: context.width * 0.2),
              SizedBox(height: context.height * 0.02),
              Text(
                isError == true
                    ? 'Failed to load image. \n Please try again.'
                    : isLoading == true
                    ? 'Loading image...'
                    : 'No image available.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: context.height * 0.02),

              Visibility(
                visible: isError == null || isLoading == true,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  constraints: BoxConstraints.tightFor(
                    width: context.width * 0.02,
                    height: context.width * 0.02,
                  ),
                ),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 500.ms, curve: Curves.easeIn)
        .then()
        .animate(onPlay: (c) => c.repeat())
        .shimmer(
          duration: 2000.ms,
          curve: Curves.easeInOut,
          color: Theme.of(context).colorScheme.secondary.withAlpha(50),
        );
  }
}
