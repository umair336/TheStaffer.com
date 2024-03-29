import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:TheStafferEmployee/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_form.dart';
import 'dart:ffi';
class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({required this.userRepository})
      : assert(userRepository != null),
        super(key: null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
