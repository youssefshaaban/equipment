import 'package:json_annotation/json_annotation.dart';


part 'custody_data.g.dart';

@JsonSerializable()
class CustodyData {

  @JsonKey(name: "CustodyId")
  int custodyId;
  @JsonKey(name: "CustodyDate")
  String custodyDate;

  @JsonKey(name: "TotalAmount")
  double totalAmount;
  @JsonKey(name: "TotalSpent")
  double totalSpent;

  @JsonKey(name: "Details")
  String details;
  @JsonKey(name: "UserId")
  int userId;

  @JsonKey(name: "FullName")
  String fullName;
  @JsonKey(name: "FullNameEn")
  String fullNameEn;
  @JsonKey(name: "RegionName")
  String regionName;
  @JsonKey(name: "RegionNameEn")
  String regionNameEn;

  @JsonKey(name: "CustodyStatus")
  int custodyStatus;
  @JsonKey(name: "DeliveryNumber")
  int deliveryNumber;
  @JsonKey(name: "ReceivingNumber")
  String receivingNumber;
  CustodyData({required this.userId,
    required this.fullNameEn,
    required this.fullName,
    required this.custodyDate,
    required this.custodyId,
    required this.custodyStatus,
    required this.deliveryNumber,
    required this.details,
    required this.receivingNumber,
    required this.regionName,
    required this.regionNameEn,
    required this.totalAmount,
    required this.totalSpent,
  });

  factory CustodyData.fromJson(Map<String, dynamic> json) => _$CustodyDataFromJson(json);

  Map<String, dynamic> toJson() => _$CustodyDataToJson(this);

}

@JsonSerializable()
class ResponseCustodyData{
  bool? success;
  String? message;
  @JsonKey(name: "CustodyData")
  List<CustodyData>? custodyData;
  ResponseCustodyData({this.success, this.message, this.custodyData});
  factory ResponseCustodyData.fromJson(Map<String, dynamic> json) => _$ResponseCustodyDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseCustodyDataToJson(this);

}