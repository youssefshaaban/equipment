import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';

class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {}

class LoginSuccessUser extends LoginState {
  final User user;
  LoginSuccessUser({required this.user});
  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}
