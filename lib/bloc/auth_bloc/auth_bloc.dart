import 'dart:async';
import 'dart:convert';
import 'package:TheStafferEmployee/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';
import 'package:TheStafferEmployee/repositories/auth.dart';

import 'package:TheStafferEmployee/models/models.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  final Auth auth;

  AuthenticationBloc({@required this.userRepository, @required this.auth})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }

    if (event is FetchAssignmentEvent) {
      try {
        List assignments =
            await userRepository.getAssignments(event.url, event.data);
        yield AssignmentLoadedState(assignments: assignments);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }

    if (event is FetchHomeEvent) {
      try {
        List data = await userRepository.getHomeData(event.url);
        List assignments = await userRepository.getAssignments(
            event.assignmentUrl, event.data);
        yield HomePageLoadedState(homeData: data, assignments: assignments);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }

    if (event is FetchTimeSheetEvent) {
      try {
        List timesheets =
            await userRepository.getTimesheets(event.url, event.data);

        print('---timesheet----');
        print(timesheets);
        yield TimesheetLoadedState(timesheets: timesheets);
      } catch (e) {
        yield ErrorState(message: e.toString());
      }
    }
  }
}
