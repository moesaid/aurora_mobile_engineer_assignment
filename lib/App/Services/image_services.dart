import 'package:aurora/App/Providers/image_provider.dart';

class ImageServices {
  final ImageProvider _provider = ImageProvider();

  // get random image
  Future<String?> getRandomImage() async {
    return await _provider.getRandomImage();
  }
}
