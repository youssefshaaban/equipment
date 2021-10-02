import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/login_data.dart';

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginUser extends LoginState {
  final User user;
  LoginUser({required this.user});
  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}
