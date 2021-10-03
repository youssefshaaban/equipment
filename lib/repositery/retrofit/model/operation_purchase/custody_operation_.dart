import 'package:json_annotation/json_annotation.dart';


part 'custody_operation_.g.dart';

@JsonSerializable()
class CustodyOper {
  @JsonKey(name: "OperId")
  int? operId;
  @JsonKey(name: "OperAmount")
  double operAmount;
  @JsonKey(name: "OperDetails")
  String? operDetails;
  @JsonKey(name: "InvoiceNumber")
  String? invoiceNumber;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "OperDate")
  String? OperDate;
  @JsonKey(name: "OperStatus")
  int operStatus = 0;
  @JsonKey(name: "CustodyId")
  int custodyId;
  CustodyOper(
      {required this.operAmount,
        this.operDetails,
        required this.custodyId,
        required this.invoiceNumber
        });

  factory CustodyOper.fromJson(Map<String, dynamic> json) => _$CustodyOperFromJson(json);

  Map<String, dynamic> toJson() => _$CustodyToJson(this);
}