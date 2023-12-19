/// This class provides a set of utility methods for making HTTP requests using Dio.
///
/// The [ApiServices] class is designed to handle common HTTP methods (get, post, put, delete)
/// with various options such as data, query parameters, authentication, and progress tracking.

import 'package:dio/dio.dart';

// Enumeration to represent HTTP request methods.
enum HttpMethod { get, post, put, delete }

class ApiServices {
  // A Dio instance for making HTTP requests.
  static final Dio _dio = Dio();

  final String baseUrl;

  // Constructor to initialize the API service with a base URL.
  ApiServices({required this.baseUrl}) {
    // Configure Dio with base options when the service is created.
    _configureDio();
  }

  // Configure Dio with base options like timeouts and the base URL.
  void _configureDio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
  }

  /*
  * Makes an HTTP request with various options.
  *
  * The [method] parameter specifies the HTTP method (get, post, put, delete).
  * The [url] parameter is the relative URL for the specific API endpoint.
  * The [data] parameter contains the request payload for methods like POST and PUT.
  * The [queryParameters] parameter contains additional query parameters for the request.
  * The [authToken] parameter is an optional authentication token for securing requests.
  * The [options] parameter allows for customization of request options.
  * The [cancelToken] parameter is used to cancel an ongoing request.
  * The [onSendProgress] and [onReceiveProgress] parameters are callbacks for tracking progress.
  *
  * Throws a [DioError] if the request fails.
  * */

  Future<Response> request(
    HttpMethod method,
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? authToken,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final apiUrl = "$baseUrl$url";

      // Determine request options, including headers and authentication.
      final requestOptions = options ?? _setOptions(authToken);

      Response response;

      // Perform the request based on the specified HTTP method.
      switch (method) {
        // Perform a GET request using Dio with provided parameters.
        case HttpMethod.get:
          response = await _dio.get(
            apiUrl,
            data: data,
            queryParameters: queryParameters,
            options: requestOptions,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case HttpMethod.post:
          // Perform a POST request using Dio with provided parameters.
          response = await _dio.post(
            apiUrl,
            data: data,
            queryParameters: queryParameters,
            options: requestOptions,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case HttpMethod.put:
          // Perform a PUT request using Dio with provided parameters.
          response = await _dio.put(
            apiUrl,
            data: data,
            queryParameters: queryParameters,
            options: requestOptions,
            cancelToken: cancelToken,
            onSendProgress: onSendProgress,
            onReceiveProgress: onReceiveProgress,
          );
          break;
        case HttpMethod.delete:
          // Perform a DELETE request using Dio with provided parameters.
          response = await _dio.delete(
            apiUrl,
            data: data,
            queryParameters: queryParameters,
            options: requestOptions,
            cancelToken: cancelToken,
          );
          break;
        default:
          throw Exception("Invalid HttpMethod");
      }

      return response;
    } catch (error) {
      // Handle and log errors, then throw an exception with a descriptive message.
      throw Exception("Failed to make the request: $error");
    }
  }

  // Define request options with optional authentication and content type.
  // Set the 'Content-Type' header and add an 'Authorization' header if an authToken is provided.
  Options _setOptions(String? authToken,
      {String contentType = "application/json"}) {
    return Options(
      headers: {
        'Content-Type': contentType,
        if (authToken != null) 'Authorization': 'Bearer $authToken',
      },
    );
  }
}
