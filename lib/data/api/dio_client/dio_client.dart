import 'dart:io';

import 'package:bloc_test/config/utils/constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio();

    // Overrided settings
    _dio
      ..options.baseUrl = Constants().baseUr
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 15000)
      ..options.responseType = ResponseType.json;
  }

  //get operations
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      return response;
    } on DioException {
      rethrow;
    }
  }
}
