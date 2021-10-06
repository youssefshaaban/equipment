import 'package:dio/dio.dart';
import 'package:equipment/repositery/retrofit/api_client.dart';
import 'package:flutter/material.dart';

class AppRepository {

  ApiClient? _apiRequest;
  Dio? dio;

  AppRepository() {
      dio = Dio(BaseOptions(contentType: "application/json"));
      dio?.interceptors.add(CustomInterceptors());
      dio?.interceptors.add(LogInterceptor(responseBody: false));
      _apiRequest = ApiClient(dio!);
    }

  ApiClient getApiClient() {
    return _apiRequest!;
  }



}

requestInterceptor(RequestOptions options) {
  debugPrint(
      "--> ${options.method != null
          ? options.method.toUpperCase()
          : 'METHOD'} ${"" + (options.baseUrl ) +
          (options.path)}");
  print("Headers:");
  options.headers.forEach((k, v) => print('$k: $v'));
  if (options.queryParameters.isNotEmpty) {
    print("queryParameters:");
    options.queryParameters.forEach((k, v) => print('$k: $v'));
  }
  if (options.data != null) {
    print("Body: ${options.data}");
  }
  print(
      "--> END ${options.method.isNotEmpty
          ? options.method.toUpperCase()
          : 'METHOD'}");
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    requestInterceptor(options);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

}