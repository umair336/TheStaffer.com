import 'dart:async';
import 'dart:math';

import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:TheStafferEmployee/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      if (event is LoginButtonPressed) {
        emit(LoginLoading());
        /////////
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        print('kkkkkkkkkkkkkk$token');
        if (token != null) {
          authenticationBloc.add(LoggedIn(token: token));
          emit(LoginInitial());
             print('oooo');
        } else {
          print('qqqqq');
          emit (LoginFailure(error: 'error'));
        }

/////////////
        /* try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        authenticationBloc.add(LoggedIn(token: token));
        emit( LoginInitial());
      } catch (error) {
        emit (LoginFailure(error: error.toString()));
      }*/
      }
    });
  }

/*
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
  */
}
