import 'package:dio/dio.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/repositery/retrofit/model/login_request.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_request.dart';
import 'package:retrofit/http.dart';

import '../apis.dart';
import 'model/login_data.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://abuzaidwf-001-site4.etempurl.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(Apis.login)
  Future<ResponseLoginData> login(@Body()LoginRequest loginRequest);

  @POST(Apis.uploadImage)
  Future<UploadImageData> uploadImage(@Body()UploadImageRequest imageRequest);

  @GET(Apis.driverCustodiesByStatus)
  Future<ResponseCustodyData> driverCustodiesByStatus(@Query("CStatus") String cStatus,
      @Query("CUser") String cUser);
}