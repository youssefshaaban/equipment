import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/repositery/retrofit/model/operation_purchase/custody_operation_.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';

class CustodyOperationsState extends Equatable {
  @override
  List<Object> get props => [];
}

class OperationLoading extends CustodyOperationsState {}

class CustodyOperationsSuccess extends CustodyOperationsState {
  final List<CustodyOper> CustodyOpers;
  CustodyOperationsSuccess({required this.CustodyOpers});
  @override
  List<Object> get props => [CustodyOpers];
}

class CustodyOperationFailure extends CustodyOperationsState {
  final String error;

  CustodyOperationFailure({required this.error});

  @override
  List<Object> get props => [error];
}
