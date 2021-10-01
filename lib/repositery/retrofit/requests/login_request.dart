import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginRequest {
  String UserName;
  String Password;
  LoginRequest(
      {required this.UserName,
        required this.Password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}