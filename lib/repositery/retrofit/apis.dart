import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

class Apis {
  static const String login = 'api/CustodyApi/LoginUser';
  static const String usersProfile = 'api/CustodyApi/UsersProfile';
  static const String updateUsersData = 'api/CustodyApi/UpdateUsersData';
  static const String driverCustodiesByStatus = 'api/CustodyApi/DriverCustodiesByStatus';
  static const String submitOperatio = 'api/CustodyApi/SubmitOperations';
  static const String deleteOperationRow = 'api/CustodyApi/DeleteOperationRow';
  static const String submitOperationImages = 'api/CustodyApi/SubmitOperationImages';
  static const String uploadImage = 'api/CustodyApi/UploadImages';

}

