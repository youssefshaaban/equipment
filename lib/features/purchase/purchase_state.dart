

import 'package:equatable/equatable.dart';
import 'package:equipment/features/purchase/purchase_process.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/upload_image_data.dart';

class PurchaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class PurchaseLoading extends PurchaseState{}

class PurchaseSuccess extends PurchaseState {
  final UploadImageData  uploadImageData;
  PurchaseSuccess({required this.uploadImageData});
  @override
  List<Object> get props => [uploadImageData];
}

class PurchaseFailure extends PurchaseState {
   final String error;

  PurchaseFailure({required this.error});

  @override
  List<Object> get props => [error];
}
