


import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';

class PurchaseDataState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class PurchaseDataLoading extends PurchaseDataState{}

class PurchaseDataSuccess extends PurchaseDataState{
  final ResponseSubmitOperation responseSubmitOperation;

  PurchaseDataSuccess({required this.responseSubmitOperation});
}

class PurchaseDataFailure extends PurchaseDataState {
  final String error;

  PurchaseDataFailure({required this.error});

  @override
  List<Object> get props => [error];
}
