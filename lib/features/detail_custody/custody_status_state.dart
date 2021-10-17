import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';

class CustodyStatusState extends Equatable {
  @override
  List<Object> get props => [];
}

class StatusLoading extends CustodyStatusState {}

class StatusSuccess extends CustodyStatusState {
  final int custodyId;
  StatusSuccess({required this.custodyId});
  @override
  List<Object> get props => [custodyId];
}

class StatusFailure extends CustodyStatusState {
  final String error;

  StatusFailure({required this.error});

  @override
  List<Object> get props => [error];
}


class DeleteOperationStatusState extends Equatable {
  @override
  List<Object> get props => [];
}


class DeleteOperationStatusLoading extends DeleteOperationStatusState {}

class DeleteOperationStatusSuccess extends DeleteOperationStatusState {
  final bool success;
  DeleteOperationStatusSuccess({required this.success});
  @override
  List<Object> get props => [success];
}

class DeleteOperationStatusFailure extends DeleteOperationStatusState {
  final String error;

  DeleteOperationStatusFailure({required this.error});

  @override
  List<Object> get props => [error];
}




class UpdateOperationStatusState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateOperationStatusLoading extends UpdateOperationStatusState {}

class UpdateOperationStatusSuccess extends UpdateOperationStatusState {
  final bool success;
  UpdateOperationStatusSuccess({required this.success});
  @override
  List<Object> get props => [success];
}

class UpdateOperationStatusFailure extends UpdateOperationStatusState {
  final String error;

  UpdateOperationStatusFailure({required this.error});

  @override
  List<Object> get props => [error];
}