import 'package:dio/dio.dart';
import 'package:equipment/repositery/retrofit/api_client.dart';

class AppRepository {

  ApiClient? _apiRequest;
  Dio? dio;

  AppRepository() {
    dio = Dio(BaseOptions(contentType: "application/json"));
    _apiRequest = ApiClient(dio!);
  }
  ApiClient getApiClient(){
    return _apiRequest!;
  }
}