import 'package:json_annotation/json_annotation.dart';

import 'login_data.dart';

part 'profile_data.g.dart';


@JsonSerializable()
class ResponseProfileData{
  bool? success;
  String? message;
  User? ProfileData;
  ResponseProfileData({this.success, this.message, this.ProfileData});
  factory ResponseProfileData.fromJson(Map<String, dynamic> json) => _$ResponseProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseProfileDataToJson(this);

}