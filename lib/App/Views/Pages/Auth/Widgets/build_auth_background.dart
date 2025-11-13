import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BuildAuthBackground extends StatelessWidget {
  const BuildAuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/aurora-fallback.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 1500.ms, curve: Curves.easeInOut)
        .then(delay: 5000.ms)
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(1.2, 1.2),
          duration: 10000.ms,
          curve: Curves.easeInOut,
        );
  }
}
