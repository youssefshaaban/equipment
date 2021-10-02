import 'package:json_annotation/json_annotation.dart';

part 'upload_image_data.g.dart';

@JsonSerializable()
class UploadImageData {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "FullPath")
  String fullPath;
  @JsonKey(name: "message")
  String message;
  UploadImageData(
      {required this.message,
        required this.success,required this.fullPath});

  factory UploadImageData.fromJson(Map<String, dynamic> json) => _$UploadImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$UploadImageDataToJson(this);
}