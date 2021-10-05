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
