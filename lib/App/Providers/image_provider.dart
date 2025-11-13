import 'package:aurora/Config/app_config.dart';
import 'package:aurora/Helpers/call_pipeline_helper.dart';
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
}
