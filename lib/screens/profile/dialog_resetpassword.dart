import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:another_flushbar/flushbar.dart';
import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Color _c = Colors.redAccent;
  bool _showPassword = true;
  bool _changePassword = true;
  bool _confirmPassword = true;
  final currentpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpassword = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _changePasswordVisibility() {
    setState(() {
      _changePassword = !_changePassword;
    });
  }

  void _conmfirmPasswordVisibility() {
    setState(() {
      _confirmPassword = !_confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          AlertDialog(content: Container(), actions: <Widget>[
            Column(children: [
              Padding(
                padding: EdgeInsets.all(14),
                child: TextFormField(
                  controller: currentpassword,
                  obscureText: _showPassword,
                  style: TextStyle(
                      fontSize: 14.0, color: Color.fromRGBO(83, 83, 83, 1)
                      // fontWeight: FontWeight.bold
                      ),
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: _showPassword
                          ? Icon(Icons.visibility,
                              color: Color.fromRGBO(183, 14, 105, 1))
                          : Icon(Icons.visibility_off,
                              color: Color.fromRGBO(183, 14, 105, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                    labelText: "Current Password",
                    hintStyle: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                    labelStyle: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  autocorrect: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14),
                child: TextFormField(
                  obscureText: _changePassword,
                  controller: newpassword,
                  style: TextStyle(
                      fontSize: 14.0, color: Color.fromRGBO(83, 83, 83, 1)
                      // fontWeight: FontWeight.bold
                      ),
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _changePasswordVisibility,
                      child: _changePassword
                          ? Icon(Icons.visibility,
                              color: Color.fromRGBO(183, 14, 105, 1))
                          : Icon(Icons.visibility_off,
                              color: Color.fromRGBO(183, 14, 105, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                    labelText: "New Password",
                    hintStyle: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                    labelStyle: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  autocorrect: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(14),
                child: TextFormField(
                  obscureText: _confirmPassword,
                  controller: confirmpassword,
                  style: TextStyle(
                      fontSize: 14.0, color: Color.fromRGBO(83, 83, 83, 1)
                      // fontWeight: FontWeight.bold
                      ),
                  cursorColor: Colors.grey.shade500,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: _conmfirmPasswordVisibility,
                      child: _confirmPassword
                          ? Icon(Icons.visibility,
                              color: Color.fromRGBO(183, 14, 105, 1))
                          : Icon(Icons.visibility_off,
                              color: Color.fromRGBO(183, 14, 105, 1)),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5.0)),
                    contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                    labelText: "Confirm Password",
                    hintStyle: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                    labelStyle: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(83, 83, 83, 1),
                        fontWeight: FontWeight.w500),
                  ),
                  autocorrect: false,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),

                        child: TextButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(13, 91, 196, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),

                                //   side: BorderSide(color: Colors.red.shade900),
                              ),
                            ),
                          ),
                          //      color: Colors.black,
                          //  textColor: Colors.white,
                          //     shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            //          Navigator.push(context,
                            //            MaterialPageRoute(builder: (context) => Profile()));

                            setState(() {
                              //functionChangepassword();
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),
                        //        width: 230,
                        child: TextButton(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),

                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(13, 91, 196, 1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),

                                //   side: BorderSide(color: Colors.red.shade900),
                              ),
                            ),
                          ),
                          //      color: Colors.black,
                          //  textColor: Colors.white,
                          //     shape: RoundedRectangleBorder(
                          //borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            //          Navigator.push(context,
                            //            MaterialPageRoute(builder: (context) => Profile()));

                            setState(() {
                              functionChangepassword();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ]),
        ],
      ),
    );
  }

  functionChangepassword() {
    String curentp = currentpassword.text;
    String newp = newpassword.text;
    String confirmp = confirmpassword.text;
    // print('ddddddddddddddddddddddddddddddd$cp');
    if (newp == confirmp) {
      print('truen');
    } else {
      print('false');
    }
    if (curentp != '' && newp != '' && confirmp != '') {
      print('correct');
      if (newp == confirmp) {
        print('truen');

        postRequest(curentp, newp, confirmp);
      } else {
        /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("new and confirm password not match"),
          backgroundColor: Color.fromRGBO(183, 14, 105, 1),
        ));*/
        Flushbar(
          // title: 'Hey Ninja',
          message: 'New and confirm password do not match.',
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(183, 14, 105, 1),
        ).show(context);

        print('false');
      }

      // postRequest(curentp , newp , confirmp );
    } else {
      /*  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Fill the required filled"),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ));*/
      Flushbar(
        //   title: 'Hey Ninja',
        message: 'Fill all fields.',
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ).show(context);

      print('wrong');
    }
  }

  Future<http.Response> postRequest(
      String curentp, String newp, String confirmp) async {
    final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
    final String token = await storage.read(key: 'token');
    String authorization = token;
    var urll = 'https://dev2.thestaffer.com/api/admin/reset-password';

    Map data = {
      'password': curentp,
      'new_password': newp,
      'confirm_password': confirmp
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(Uri.parse(urll),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $authorization'
        },
        body: body);
    print("${response.statusCode}");
    if (response.statusCode == 200) {
      print('ssssssssssssssssssssssss${response.body}');
      if(response.body.contains('successfully')){
          BlocProvider.of<AuthenticationBloc>(
                                                  context)
                                              .add(
                                            LoggedOut(),
                                          );
                                          Navigator.pop(context);
      }
      else
      Flushbar(
        //   title: 'Hey Ninja',
        message: response.body.substring(11, response.body.length - 2),
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ).show(context);
    }
    /* if (response.statusCode == 200) {
      // Navigator.pop(context);
    }*/
    print("${response.body}");
    return response;
  }
}
