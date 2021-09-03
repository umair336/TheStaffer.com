import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  const LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {}
class FetchAssignmentEvent extends AuthenticationEvent {
  final String url;
  final Object data;

  const FetchAssignmentEvent({@required this.url, @required this.data});

  @override
  List<Object> get props => [url,data];

  @override
  String toString() => 'FetchAssignmentEvent { url: $url, data: $data }';
}

class FetchHomeEvent extends AuthenticationEvent {
  final String url;
  final String assignmentUrl;
  final Object data;



  const FetchHomeEvent({@required this.url, @required this.assignmentUrl, @required this.data});

  @override
  List<Object> get props => [url,assignmentUrl,data];

  @override
  String toString() => 'FetchHomeEvent { url: $url, assignmentUrl: $assignmentUrl, data: $data}';
}

class FetchTimeSheetEvent extends AuthenticationEvent {
  final String url;
  final Object data;

  const FetchTimeSheetEvent({@required this.url, @required this.data});

  @override
  List<Object> get props => [url,data];

  @override
  String toString() => 'FetchTimeSheetEvent { url: $url, data: $data }';
}