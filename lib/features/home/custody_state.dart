import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/custody/custody_data.dart';
import 'package:equipment/repositery/retrofit/model/login_data.dart';

class CustodyState extends Equatable {
  @override
  List<Object> get props => [];
}

class CustodyLoading extends CustodyState {}

class CustodySuccessUser extends CustodyState {
  final List<CustodyData> custodies;
  CustodySuccessUser({required this.custodies});
  @override
  List<Object> get props => [custodies];
}

class CustodyFailure extends CustodyState {
  final String error;

  CustodyFailure({required this.error});

  @override
  List<Object> get props => [error];
}
