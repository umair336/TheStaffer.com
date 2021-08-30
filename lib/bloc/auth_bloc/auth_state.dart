import 'package:equatable/equatable.dart';
import 'package:staffer/models/models.dart';
import 'package:meta/meta.dart';
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AssignmentLoadedState extends AuthenticationState {

  // final Assignment assignments;
  final List assignments;


  AssignmentLoadedState({@required this.assignments});

  @override
  List<List> get props => [assignments];
}

class AssignmentErrorState extends AuthenticationState {

  final String message;

  AssignmentErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}

class HomePageLoadedState extends AuthenticationState {

  final List homeData;
  HomePageLoadedState({@required this.homeData});
  @override
  List<List> get props => [homeData];
}
