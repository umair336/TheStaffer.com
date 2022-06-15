import 'dart:io';

import 'package:TheStafferEmployee/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc/auth.dart';
import 'bloc/auth_bloc/auth_bloc.dart';
import 'repositories/repositories.dart';
import 'screens/auth/intro_screen.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'screens/auth/login_screen.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
/*
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}
*/

Future<void> main() async {
  // BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final userRepository = UserRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStarted());
      },
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  var introskip;

  /*bool _seen;
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      print('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX$_seen');
      //   t = _seen.toString();
      return _seen;
    } else {
      await prefs.setBool('seen', true);
      print('XXXXXXXXXXXXXXXXXXXX$_seen');
      //   t = _seen.toString();
      return _seen;
    }
  }
*/
  Future check() async {
    final String v = await storage.read(key: 'firsttime');

    print("asssssssssssss$v");
    introskip = v.toString();
    print("VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV$introskip");
  }

  Future<void> first(String val) async {
    await storage.write(key: 'firsttime', value: val);
  }
/*
  Future<void> deleteToken() async {
    storage.delete(key: 'firsttime');
    //   storage.deleteAll();
  }*/

  @override
  void initState() {
    super.initState();
    check();

    // checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            print("AAAAAAAAAAAAAAAAAAAAAAA");
            return MainScreen();
          }
          if (state is AuthenticationUninitialized) {
            //      check();
            print("BBBBBBBBBBBBBBBBBBB$introskip");

            return LoginScreen(
              userRepository: widget.userRepository,
            );
          }
          if (state is AuthenticationUnauthenticated) {
            print("CCCCCCCCCCCCCCCCCCCCCCCCCCC$introskip");
            if (introskip == 'null') {
              print('qqq');
              return IntroPage(userRepository: widget.userRepository);
            } else {
              print('vvv');
              return LoginScreen(userRepository: widget.userRepository);
            }
            //deleteToken();
            // first('KKKKKKKKKKKK');
            //     check();

            /* print("YYYYYYYYYYYYYYYYYYYYYYY$_seen");

            if (_seen == false) {
              print("aaaaaaaaaaaaaaaaa");
                 return IntroPage(userRepository: widget.userRepository);
            } else {
              print('bbbbbbbbbbbbbbb');
                 return LoginScreen(userRepository: widget.userRepository);
            }

         
*/
            return IntroPage(userRepository: widget.userRepository);
          }
          if (state is AuthenticationLoading) {
            print("DDDDDDDDDDDDDDDD");
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Style.Colors.mainColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return MainScreen();
          return Scaffold(
            body: Container(
                //     color: Colors.white,
                //     width: MediaQuery.of(context).size.width,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         SizedBox(
                //           height: 25.0,
                //           width: 25.0,
                //           child: CircularProgressIndicator(
                //             valueColor: new AlwaysStoppedAnimation<Color>(
                //                 Style.Colors.mainColor),
                //             strokeWidth: 4.0,
                //           ),
                //         )
                //       ],
                //     ),
                ),
          );
        },
      ),
    );
  }
}


/*
class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('mn', 'MN'),
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
            print("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZ");
            return MainScreen();
          }
          if (state is AuthenticationUninitialized) {
            print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
            return LoginScreen(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticationUnauthenticated) {
            print("YYYYYYYYYYYYYYYYYYYYYYY");
            

            return IntroPage(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return Scaffold(
              body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Style.Colors.mainColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return MainScreen();
          return Scaffold(
            body: Container(
                //     color: Colors.white,
                //     width: MediaQuery.of(context).size.width,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         SizedBox(
                //           height: 25.0,
                //           width: 25.0,
                //           child: CircularProgressIndicator(
                //             valueColor: new AlwaysStoppedAnimation<Color>(
                //                 Style.Colors.mainColor),
                //             strokeWidth: 4.0,
                //           ),
                //         )
                //       ],
                //     ),
                ),
          );
        },
      ),
    );
  }
}
*/