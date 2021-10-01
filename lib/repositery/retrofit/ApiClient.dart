import 'package:dio/dio.dart';
import 'package:equipment/repositery/model/login_data.dart';
import 'package:equipment/repositery/retrofit/apis.dart';
import 'package:equipment/repositery/retrofit/requests/login_request.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: "http://abuzaidwf-001-site4.etempurl.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(Apis.login)
  Future<ResponseLoginData> login(@Body() LoginRequest loginRequest);


  // @GET(Apis.usersProfile)
  // Future<ResponseLoginData> getUserProfile(@Body() LoginRequest loginRequest);
}
