import 'package:equatable/equatable.dart';
import 'package:equipment/repositery/retrofit/model/user/login_data.dart';

class DataState extends Equatable {
  @override
  List<Object> get props => [];
}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final User data;
  DataSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class DataFailure extends DataState {
  final String error;

  DataFailure({required this.error});

  @override
  List<Object> get props => [error];
}
