import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:another_flushbar/flushbar.dart';

class Ssnscreen extends StatefulWidget {
  @override
  State<Ssnscreen> createState() => _SsnscreenState();
}

class _SsnscreenState extends State<Ssnscreen> {
  bool _showPassword = true;
  final password = TextEditingController();
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          AlertDialog(content: Container(), actions: <Widget>[
            Column(children: [
              Padding(
                padding: EdgeInsets.all(14),
                child: TextFormField(
                  controller: password,
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
                              functionShowSSN();
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

  functionShowSSN() {
    String curentpassword = password.text;
    if (curentpassword != '') {
      print('aaaaaaaaaaaaaaaaaaaaaaaaa');
      postRequestSSn(curentpassword);
    } else {
      Flushbar(
        //   title: 'Hey Ninja',
        message: 'Enter a password',
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ).show(context);
    }
  }

  Future<http.Response> postRequestSSn(String curentp) async {
    print('ssssssssssssssssssssssssssss$curentp');
    final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
    final String token = await storage.read(key: 'token');
    String authorization = token;
    var urll = 'https://dev2.thestaffer.com/api/admin/get_employee_ssn';

    Map data = {
      'password': curentp,
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
      Flushbar(
        //   title: 'Hey Ninja',
        message: response.body,
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ).show(context);
    }
    print(response);
    if (response.body.contains('true')) {
      print('uuuuuuuuuuuuuuuuuuuuuu');
   
         // Navigator.pop(context,);
   
    }
    if (response.body.contains('false')) {
      print('uuuuuuuuuuuuuuuuuuuuuu');
      Flushbar(
        //   title: 'Hey Ninja',
        message: 'Password not match',
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ).show(context);
      // Navigator.pop(context);
    }

    print("${response.body}");
    return response;
  }
}
