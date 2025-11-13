import 'package:aurora/App/Services/image_services.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ImageServices _imageServices = ImageServices();

  final _activeImageUrl = ''.obs;
  String get activeImageUrl => _activeImageUrl.value;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _hasError = false.obs;
  bool get hasError => _hasError.value;

  final _bgColor = Rxn<Color>();
  Color? get bgColor => _bgColor.value;

  @override
  Future<void> onInit() async {
    await _intController();
    super.onInit();
  }

  Future<void> _intController() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  // fetch random image
  Future<void> fetchRandomImage() async {
    _isLoading.value = true;
    _bgColor.value = null;
    _hasError.value = false;
    update();

    final String? res = await _imageServices.getRandomImage();
    if (res == null || res.isEmpty) {
      _isLoading.value = false;
      update();
      return;
    }

    // extract average color
    final Color? avgColor = await _imageServices.getAverageColorFromBytes(
      res,
      targetHeight: 200,
      targetWidth: 200,
    );

    // update states
    _bgColor.value = avgColor;
    _activeImageUrl.value = res;
    _isLoading.value = false;
    update();
  }

  // set error state
  void setErrorState() {
    _hasError.value = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }
}
