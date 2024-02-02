part of 'login_bloc.dart';
// import 'dart:ffi';
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
// class LoginSuccess extends LoginState {
//   @override
//   List<Object> get props => [];
  
//   @override
//   String toString() => 'LoginSuccess';
// }