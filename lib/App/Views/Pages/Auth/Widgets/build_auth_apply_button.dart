import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BuildAuthApplyButton extends StatelessWidget {
  const BuildAuthApplyButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          Text(
                'Apply',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
              .animate()
              .fadeIn(delay: 8000.ms, duration: 1500.ms)
              .then()
              .animate(onPlay: (c) => c.repeat())
              .shimmer(
                duration: 3000.ms,
                curve: Curves.easeInOut,
                color: Colors.grey.shade600,
              ),
    );
  }
}
