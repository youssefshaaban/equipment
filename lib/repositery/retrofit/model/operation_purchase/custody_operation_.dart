import 'package:json_annotation/json_annotation.dart';


part 'custody_operation_.g.dart';

@JsonSerializable()
class CustodyOper {
  @JsonKey(name: "OperId")
  int? operId=0;
  @JsonKey(name: "OperAmount")
  double operAmount;
  @JsonKey(name: "OperDetails")
  String? operDetails;
  @JsonKey(name: "InvoiceNumber")
  String? invoiceNumber;
  @JsonKey(name: "DriverUserId")
  int driverUserId;
  @JsonKey(name: "images")
  List<ImagesData>? images;
  @JsonKey(name: "OperDate")
  String? OperDate;
  @JsonKey(name: "OperStatus")
  int operStatus = 0;
  @JsonKey(name: "CustodyId")
  int custodyId;
  CustodyOper(
      {required this.operAmount,
       required this.operDetails,
        required this.custodyId,
        required this.invoiceNumber,
        required this.driverUserId,
        this.images
        });


  @override
  String toString() {
    return _$CustodyOperToJson(this).toString();
  }

  factory CustodyOper.fromJson(Map<String, dynamic> json) => _$CustodyOperFromJson(json);

  Map<String, dynamic> toJson() => _$CustodyOperToJson(this);
}

@JsonSerializable()
class ResponseCustodyOpera {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "COpersData")
  List<CustodyOper> cOpersData;
  ResponseCustodyOpera({required this.cOpersData
  });

  factory ResponseCustodyOpera.fromJson(Map<String, dynamic> json) => _$ResponseCustodyOperaFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseCustodyOperaToJson(this);
}

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  BaseResponse();
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}


@JsonSerializable()
class RequestCustodyOpera{
  @JsonKey(name: "OperData")
  CustodyOper custodyOperations;
  @JsonKey(name: "ImagesData")
  List<ImagesData>? cOpersData;
  RequestCustodyOpera({required this.custodyOperations});


  factory RequestCustodyOpera.fromJson(Map<String, dynamic> json) => _$RequestCustodyOperaFromJson(json);

  Map<String, dynamic> toJson() => _$RequestCustodyOperaToJson(this);
}


@JsonSerializable()
class ImagesData {
  @JsonKey(name: "ImageId")
  int? imageId = 0;
  @JsonKey(name: "ImageData")
  String imageData;

  ImagesData({required this.imageData
  });


  @override
  String toString() {
    return _$ImagesDataToJson(this).toString();
  }

  factory ImagesData.fromJson(Map<String, dynamic> json) => _$ImagesDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesDataToJson(this);
}

@JsonSerializable()
class ResponseSubmitOperation {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "Oper_Id")
  int? oper_Id;
  ResponseSubmitOperation();

  factory ResponseSubmitOperation.fromJson(Map<String, dynamic> json) => _$ResponseSubmitOperationFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseSubmitOperationToJson(this);
}
