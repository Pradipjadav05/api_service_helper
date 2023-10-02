library api_services;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum ApiService { GET, POST, PUT, DELETE }

class ApiServices {
  Dio dio = Dio();

  Future<Response> request(
    ApiService method,
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? authToken,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      if (method == ApiService.GET) {
        final response = await dio.get(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              if (authToken != null) 'Authorization': 'Bearer $authToken',
            },
          ),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        return response;
      } else if (method == ApiService.POST) {
        final response = await dio.post(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              if (authToken != null) 'Authorization': 'Bearer $authToken',
            },
          ),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
        return response;
      } else if (method == ApiService.PUT) {
        final response = await dio.put(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              if (authToken != null) 'Authorization': 'Bearer $authToken',
            },
          ),
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
        return response;
      } else if (method == ApiService.DELETE) {
        final response = await dio.delete(
          path,
          data: data,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              if (authToken != null) 'Authorization': 'Bearer $authToken',
            },
          ),
          cancelToken: cancelToken,
        );
        return response;
      } else {
        throw Exception("Invalid ApiService");
      }
    } catch (error) {
      debugPrint("Error: $error");
      throw Exception("Failed to make the request  $error");
    }
  }
}
