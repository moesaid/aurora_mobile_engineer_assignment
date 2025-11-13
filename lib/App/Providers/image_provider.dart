import 'dart:io';

import 'package:aurora/Config/app_config.dart';
import 'package:aurora/Helpers/call_pipeline_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';

const baseUrl = '${AppConfig.apiUrl}image';

class ImageProvider extends GetConnect {
  CallPipelineHelper callPipelineServices = CallPipelineHelper();

  // Get request
  Future<String?> getRandomImage() async {
    // call api
    final data = await callPipelineServices.futureCall(
      future: () async {
        return await get(baseUrl, headers: {...AppConfig.requestHeader});
      },
      name: 'Get Random Image',
    );

    // check if data is null
    if (data.body == null || !data.status.isOk) return null;
    return data.body['url'] as String;
  }

  // load image from url
  Future<Uint8List?> loadImageFromUrl(String url) async {
    final client = HttpClient();

    // call api
    final data = await callPipelineServices.futureCall(
      future: () async {
        final req = await client.getUrl(Uri.parse(url));
        return await req.close();
      },
      name: 'Load Image From URL',
    );

    // check if data is null
    if (data.statusCode != 200) return null;

    final bytes = await consolidateHttpClientResponseBytes(data);

    return bytes;
  }
}
