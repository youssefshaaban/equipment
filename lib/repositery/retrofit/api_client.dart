import 'package:dio/dio.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:equipment/repositery/retrofit/model/user/login_request.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_request.dart';
import 'package:equipment/repositery/retrofit/model/user/profile_data.dart';
import 'package:retrofit/http.dart';

import '../apis.dart';
import 'model/user/login_data.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://abuzaidwf-001-site4.etempurl.com/")
abstract class ApiClient{
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(Apis.login)
  Future<ResponseLoginData> login(@Body()LoginRequest loginRequest);

  @GET("api/CustodyApi/UsersProfile/{id}")
  Future<ResponseProfileData> getProfile(@Path("id")int id);

  @POST(Apis.uploadImage)
  Future<UploadImageData> uploadImage(@Body()UploadImageRequest imageRequest);

  @GET(Apis.driverCustodiesByStatus)
  Future<ResponseCustodyData> driverCustodiesByStatus(@Query("CStatus") String cStatus,
      @Query("CUser") String cUser);

  @POST(Apis.submitOperation)
  Future<ResponseSubmitOperation> submitOperation(@Body() RequestCustodyOpera custodyOper);

  @GET("${Apis.getCustodyOperation}/{id}")
  Future<ResponseCustodyOpera> getCustodyOperation(@Path("id") int id);

  @GET("${Apis.deleteOperation}/{id}")
  Future<BaseResponse> deleteOperation(@Path("id") int id);

  @GET(Apis.updateCustodyStatus)
  Future<ResponseUpdateCustodyData> updateStatusCustody(@Query("Status") String cStatus,
      @Query("CId") String cUser);

}