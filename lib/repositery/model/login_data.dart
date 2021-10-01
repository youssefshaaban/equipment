import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  int? UserId;
  String? FullName;
  String? FullNameEn;
  String? UserName;
  String? Password;
  String? Picture;
  String? Phone;

  User(
      {this.UserId, this.FullName, this.FullNameEn, this.Password, this.Phone, this.UserName, this.Picture});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class ResponseLoginData{
  bool? success;
  String? message;
  dynamic loginUserData;
  ResponseLoginData({this.success, this.message, this.loginUserData});
  factory ResponseLoginData.fromJson(Map<String, dynamic> json) => _$ResponseLoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseLoginDataToJson(this);

}