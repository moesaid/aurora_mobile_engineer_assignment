import 'dart:typed_data' as ui;
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:aurora/App/Providers/image_provider.dart';

class ImageServices {
  final ImageProvider _provider = ImageProvider();

  // get random image
  Future<String?> getRandomImage() async {
    return await _provider.getRandomImage();
  }

  // load image from url
  Future<Color?> getAverageColorFromBytes(
    String url, {
    int? targetWidth,
    int? targetHeight,
  }) async {
    final bytes = await _provider.loadImageFromUrl(url);
    if (bytes == null) return null;

    // Decode and downscale
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: targetWidth,
      targetHeight: targetHeight,
    );
    final frame = await codec.getNextFrame();
    final ui.Image image = frame.image;

    final ui.ByteData? bd = await image.toByteData();
    // optionally free the image if you won't use it
    try {
      if (bd == null) return null;
      final ui.Uint8List pixels = bd.buffer.asUint8List();

      int r = 0, g = 0, b = 0, count = 0;
      for (int i = 0; i + 3 < pixels.length; i += 4) {
        final int alpha = pixels[i + 3];
        if (alpha == 0) continue; // skip fully transparent
        r += pixels[i];
        g += pixels[i + 1];
        b += pixels[i + 2];
        count++;
      }

      if (count == 0) return null;
      return Color.fromARGB(255, (r ~/ count), (g ~/ count), (b ~/ count));
    } finally {
      // free native image memory
      image.dispose();
    }
  }
}
