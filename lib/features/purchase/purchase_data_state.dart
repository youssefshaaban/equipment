


import 'package:equatable/equatable.dart';

class PurchaseDataState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class PurchaseDataLoading extends PurchaseDataState{}

class PurchaseDataSuccess extends PurchaseDataState{

}

class PurchaseDataFailure extends PurchaseDataState {
  final String error;

  PurchaseDataFailure({required this.error});

  @override
  List<Object> get props => [error];
}
