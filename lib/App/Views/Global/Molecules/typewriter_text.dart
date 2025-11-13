import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class TypewriterText extends StatelessWidget {
  const TypewriterText(
    this.text, {
    super.key,
    this.style,
    this.cps = 16,
    this.initialDelay = Duration.zero,
    this.cursor,
    this.cursorBlink = const Duration(milliseconds: 520),
    this.cursorFadeOut = const Duration(milliseconds: 220),
    this.center = false,
    this.onTick,
    this.onDone,
    this.tickForSpaces,
  });

  final String text;
  final TextStyle? style;
  final double cps;
  final Duration initialDelay;
  final Widget? cursor;
  final Duration cursorBlink;
  final Duration cursorFadeOut;
  final bool center;

  final Function(int index, String char)? onTick;
  final VoidCallback? onDone;
  final bool? tickForSpaces;

  @override
  Widget build(BuildContext context) {
    final chars = text.characters; // keep as Characters
    final total = chars.length;
    final totalDuration = Duration(milliseconds: (total / cps * 1000).round());

    // We need to ensure onTick fires only once per glyph.
    // This local variable is captured by the animation builder closure.
    int lastNotified = -1;

    // === Typing text ===
    final typing = const SizedBox.shrink()
        .animate(delay: initialDelay)
        .custom(
          duration: totalDuration,
          builder: (context, value, _) {
            final count = (value * total).clamp(0, total).floor();

            // fire onTick exactly once per new glyph
            if (count - 1 > lastNotified && count > 0) {
              final idx = count - 1;
              final ch = chars.elementAt(idx);
              if (onTick != null) {
                if (tickForSpaces! || ch.trim().isNotEmpty) {
                  onTick!(idx, ch);
                }
              }
              lastNotified = idx;
            }

            // when we reach the end, call onDone once
            if (count == total && lastNotified == total - 1 && onDone != null) {
              // schedule microtask to avoid calling setState inside build
              Future.microtask(onDone!);
            }

            final visible = chars.take(count).toString(); // or .toList().join()

            return Text(visible, style: style);
          },
        );

    // === Cursor blinks during typing, then fades out ===
    final Widget cursorChild =
        cursor ??
        CircleAvatar(
          radius: context.textScaleFactor * 8,
          backgroundColor: style?.color ?? Colors.black,
        );

    // 1) Inner: BLINK LOOP (repeat reverse)
    final blinking = cursorChild
        .animate(onPlay: (c) => c.repeat(reverse: true, period: 300.ms))
        // one blink cycle = fade in then fade out
        .fadeIn(duration: cursorBlink ~/ 2, curve: Curves.easeInOut)
        .fadeOut(duration: cursorBlink ~/ 2, curve: Curves.easeInOut);

    // 2) Outer: LIFETIME GATE (respect delay, then disappear when done)
    final cursorWidget = blinking
        .animate() // a separate timeline layered on top
        .fadeIn(
          // keep invisible until typing starts
          begin: 0,
          delay: initialDelay - 500.ms,
          duration: 1.ms, // appear instantly at the delay
        )
        .then(delay: totalDuration + 500.ms) // after typing finishes…
        .fadeOut(duration: cursorFadeOut, curve: Curves.easeOut);

    return Row(
      mainAxisAlignment: center
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [typing, cursorWidget],
    );
  }
}
