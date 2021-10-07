

import 'package:equatable/equatable.dart';
import 'package:equipment/features/purchase/purchase_process_page.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';

class PurchaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class PurchaseLoading extends PurchaseState{}

class PurchaseSuccess extends PurchaseState {
  final int?  operId;
  PurchaseSuccess({required this.operId});
  @override
  List<Object> get props => [operId!];
}

class PurchaseFailure extends PurchaseState {
   final String error;

  PurchaseFailure({required this.error});

  @override
  List<Object> get props => [error];
}


class ImageUploadStateState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImageUploadLoading extends ImageUploadStateState{}

class ImageUploadSuccess extends ImageUploadStateState {
  final UploadImageData  uploadImageData;
  ImageUploadSuccess({required this.uploadImageData});
  @override
  List<Object> get props => [uploadImageData];
}

class ImageUploadFailure extends ImageUploadStateState {
  final String error;

  ImageUploadFailure({required this.error});

  @override
  List<Object> get props => [error];
}
