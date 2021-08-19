import 'dart:async';
import 'package:staffer/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'auth.dart';
import 'package:staffer/repositories/auth.dart';

import 'package:staffer/models/models.dart';

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
      // yield AuthenticationLoading();
      try {
        final assignments = await userRepository.getAssignments(event.url, event.data);
        print(assignments);
        // yield AssignmentLoadedState(assignments: assignments);
        //  yield AuthenticationAuthenticated();
      } catch (e) {
        // yield AssignmentErrorState(message: e.toString());
      }
    }

    // if (event is FetchAssignmentEvent) {
    //   yield AssignmentLoadingState();
    //   try {
    //     List<Assignment> assignments = await repository.getAssignments();
    //     yield AssignmentLoadedState(assignments: assignments);
    //   } catch (e) {
    //     yield AssignmentErrorState(message: e.toString());
    //   }
    // }
  }
}
