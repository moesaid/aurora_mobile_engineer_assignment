import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallPipelineHelper {
  // A method to wrap future calls with additional functionality like logging, error handling, etc.
  Future<T> futureCall<T>({
    required Future<T> Function() future,
    required String name,
  }) async {
    try {
      final result = await future();
      return result;
    } catch (e) {
      Get.snackbar(
        'Opps!',
        'An error occurred during $name operation.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      rethrow;
    }
  }
}
