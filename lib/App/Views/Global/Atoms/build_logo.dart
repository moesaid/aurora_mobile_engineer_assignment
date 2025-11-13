import 'package:flutter/material.dart';

class BuildLogo extends StatelessWidget {
  const BuildLogo({super.key, this.color, this.size});
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? Theme.of(context).colorScheme.inverseSurface;

    return Image.asset(
      'assets/images/logo-o.png',
      width: size ?? 100,
      height: size ?? 100,
      color: color,
    );
  }
}
