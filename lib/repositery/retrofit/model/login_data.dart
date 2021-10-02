import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';
@JsonSerializable()
class User {
  @JsonKey(name: "UserId")
  int? userId;
  @JsonKey(name: "FullName")
  String? fullName;
  @JsonKey(name: "FullNameEn")
  String? fullNameEn;
  @JsonKey(name: "UserName")
  String? userName;
  @JsonKey(name: "Password")
  String? password;
  @JsonKey(name: "Picture")
  String? picture;
  @JsonKey(name: "Phone")
  String? phone;

  User(
      {this.userId,this.password,this.userName,this.fullName,this.fullNameEn,this.phone,this.picture});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class ResponseLoginData{
  bool? success;
  String? message;
  User? loginUserData;
  ResponseLoginData({this.success, this.message, this.loginUserData});
  factory ResponseLoginData.fromJson(Map<String, dynamic> json) => _$ResponseLoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseLoginDataToJson(this);

}