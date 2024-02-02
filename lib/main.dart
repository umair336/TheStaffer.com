import 'package:TheStafferEmployee/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc/auth.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final userRepository = UserRepository();

  runApp( 
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository, auth: null)
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
  MyApp({ required this.userRepository}) : super(key: null);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  var introskip;
  Future check() async {
    final String? v = await storage.read(key: 'firsttime');   
    introskip = v.toString();
  }
  Future<void> first(String val) async {
    await storage.write(key: 'firsttime', value: val);
  }
  @override
  void initState() {
    super.initState();
    check();
  }
  @override
  Widget build(BuildContext context) {
  //  try{
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
            return LoginScreen(userRepository: widget.userRepository,);
          }
          if (state is AuthenticationUnauthenticated) {
            return IntroPage(userRepository: widget.userRepository);
          }
          // if (state is AuthenticationAuthenticated) {
          //   return MainScreen();
          // }
          // if (state is AuthenticationUninitialized) {
          //   return LoginScreen(
          //     userRepository: widget.userRepository,
          //   );
          // }
          // if (state is AuthenticationUnauthenticated) {
          //   if (introskip == 'null') {
          //     return IntroPage(userRepository: widget.userRepository);
          //   } else {
          //     return LoginScreen(userRepository: widget.userRepository);
          //   }
          //   return IntroPage(userRepository: widget.userRepository);
          // }
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

          return IntroPage(userRepository: widget.userRepository,);
        },
      ),
    );
  //  }
  //  catch(e,stacktrace){
  //   print('error in the build method is:$e\n$stacktrace');
  //   return Container(
  //     child: Text('An error occurred.'),
  //   );
  //  }
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