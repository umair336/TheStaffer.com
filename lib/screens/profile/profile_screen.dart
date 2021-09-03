import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:staffer/bloc/auth_bloc/auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  // const ProfileScreen({ Key? key }) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.1,
                      0.5,
                    ],
                    colors: [
                      Color.fromRGBO(0, 91, 196, 1),
                      Color.fromRGBO(97, 29, 165, 1),
                    ],
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 7, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              EvaIcons.logOutOutline,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              BlocProvider.of<AuthenticationBloc>(context).add(
                                LoggedOut(),
                              );
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Row(
                          children: [
                            Container(
                              child: IconButton(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    'Employee Name Here',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Nunito Sans',
                                      color: Color.fromRGBO(13, 91, 196, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Job Position will Come here',
                                    style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      // fontWeight: FontWeight.semibold,
                                      fontSize: 10.0,
                                      color: Color.fromRGBO(83, 83, 83, 1),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/Union 6@2x.png",
                              height: size.height * 0.02,
                              // fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '000 0000 000',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 51),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/003-envelope@2x.png",
                              height: size.height * 0.02,
                              // fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'employeeemail@email.com',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/001-birthday@2x.png",
                              height: size.height * 0.02,
                              // fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'JAN 00,2000',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 52),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/Union 7@2x.png",
                              height: size.height * 0.02,
                              // fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '000 00 0000',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                                color: Color.fromRGBO(83, 83, 83, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 61),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/placeholder@2x.png",
                              height: size.height * 0.02,
                              // fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    '1500 Coastal and Myrtle Beach ',
                                    style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Color.fromRGBO(83, 83, 83, 1),
                                    ),
                                  ),
                                  Text(
                                    'SC 29577',
                                    style: TextStyle(
                                      fontFamily: 'Nunito Sans',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: Color.fromRGBO(83, 83, 83, 1),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 57),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/rotation-lock@2x.png",
                              height: size.height * 0.02,
                              // fit: BoxFit.cover,
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Stack(
                                            //   alignment: Alignment.center,

                                            children: <Widget>[
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.30,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'Reset Password',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontSize: 15.0,
                                                          color: Color.fromRGBO(
                                                              13, 91, 196, 1),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    TextFormField(
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Color.fromRGBO(
                                                              83, 83, 83, 1)
                                                          // fontWeight: FontWeight.bold
                                                          ),
                                                      cursorColor:
                                                          Colors.grey.shade300,
                                                      decoration:
                                                          InputDecoration(
                                                        suffixIcon: Icon(
                                                          Icons
                                                              .visibility_outlined,
                                                          color: Color.fromRGBO(
                                                              183, 14, 105, 1),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        labelText: "Password",
                                                        hintStyle: TextStyle(
                                                            fontSize: 12.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    83,
                                                                    83,
                                                                    83,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        labelStyle: TextStyle(
                                                            fontSize: 12.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    83,
                                                                    83,
                                                                    83,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      autocorrect: false,
                                                    ),
                                                    SizedBox(
                                                      height: 20.0,
                                                    ),
                                                    TextFormField(
                                                      obscureText:
                                                          _showPassword,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Color.fromRGBO(
                                                              83, 83, 83, 1),
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      cursorColor:
                                                          Colors.grey.shade300,
                                                      //   controller: _passwordController,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors
                                                            .grey.shade300,
                                                        suffixIcon:
                                                            GestureDetector(
                                                          onTap:
                                                              _togglePasswordVisibility,
                                                          child: _showPassword
                                                              ? Icon(
                                                                  Icons
                                                                      .visibility_off_outlined,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          183,
                                                                          14,
                                                                          105,
                                                                          1))
                                                              : Icon(
                                                                  Icons
                                                                      .visibility_off,
                                                                  color: Colors
                                                                      .red),
                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide:
                                                                new BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        labelText:
                                                            "Confirm Password",
                                                        hintStyle: TextStyle(
                                                            fontSize: 12.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    83,
                                                                    83,
                                                                    83,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        labelStyle: TextStyle(
                                                            fontSize: 12.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    83,
                                                                    83,
                                                                    83,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      autocorrect: false,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                                      //   color: Color.fromRGBO(23, 197, 204, 1),
                                                      width: 230,
                                                      child: TextButton(
                                                        child: Text(
                                                          'Save',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                            color: Colors.white,
                                                          ),
                                                        ),

                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all<Color>(Color
                                                                      .fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                          shape: MaterialStateProperty
                                                              .all<
                                                                  RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),

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
                                                        },
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                    fontFamily: 'Nunito Sans',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(13, 91, 196, 1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 175),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
