import 'package:json_annotation/json_annotation.dart';


part 'custody_request.g.dart';

@JsonSerializable()
class CustodyRequest {
  @JsonKey(name: "CStatus")
  String cStatus;
  @JsonKey(name: "CUser")
  String cUser;
  CustodyRequest(
      {required this.cUser,
        required this.cStatus});

  factory CustodyRequest.fromJson(Map<String, dynamic> json) => _$CustodyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustodyRequestToJson(this);
}