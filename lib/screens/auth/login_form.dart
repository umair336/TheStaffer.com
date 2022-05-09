import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:TheStafferEmployee/repositories/repositories.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Please enter correct credentials"),
              backgroundColor: Colors.red.shade900,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          var size = MediaQuery.of(context).size;

          return Scaffold(
            body: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/Group 12874.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 80.0),
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.14),
                          Image.asset(
                            "images/Group 12869.png",
                            height: size.height * 0.10,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.10),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          TextFormField(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              // fontWeight: FontWeight.bold
                            ),
                            cursorColor: Colors.white,
                            controller: _usernameController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white60),
                                  borderRadius: BorderRadius.circular(5.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white60),
                                  borderRadius: BorderRadius.circular(5.0)),
                              contentPadding:
                                  EdgeInsets.only(left: 10.0, right: 10.0),
                              labelText: "User name",
                              hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              labelStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            autocorrect: false,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            obscureText: _showPassword,
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            cursorColor: Colors.white,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              suffixIcon: GestureDetector(
                                onTap: _togglePasswordVisibility,
                                child: _showPassword
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.white60,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.white60,
                                      ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white60),
                                  borderRadius: BorderRadius.circular(5.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white60),
                                  borderRadius: BorderRadius.circular(5.0)),
                              contentPadding:
                                  EdgeInsets.only(left: 10.0, right: 10.0),
                              labelText: "Password",
                              hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              labelStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            autocorrect: false,
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _launchURL();
                                });
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(
                                    height: 45,
                                    child: state is LoginLoading
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Center(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 25.0,
                                                    width: 25.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          new AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Style.Colors
                                                                  .mainColor),
                                                      strokeWidth: 4.0,
                                                    ),
                                                  )
                                                ],
                                              )),
                                            ],
                                          )
                                        : RaisedButton(
                                            color: Color.fromRGBO(39, 0, 64, 1),
                                            disabledColor:
                                                Style.Colors.mainColor,
                                            disabledTextColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: BorderSide(
                                                  color: Colors.white),
                                            ),
                                            onPressed: _onLoginButtonPressed,
                                            child: Text("LOG IN",
                                                style: new TextStyle(
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white)))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _launchURL() async {
    final String _url = 'https://dev2.thestaffer.com/login';
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
