import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';

class CustodyOperationsState extends Equatable {
  @override
  List<Object> get props => [];
}

class OperationLoading extends CustodyOperationsState {}

class CustodyOperationsSuccess extends CustodyOperationsState {
  final List<CustodyOper> custodyOpers;
  CustodyOperationsSuccess({required this.custodyOpers});
  @override
  List<Object> get props => [custodyOpers];
}

class CustodyOperationFailure extends CustodyOperationsState {
  final String error;

  CustodyOperationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
