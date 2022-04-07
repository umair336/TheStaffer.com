import 'dart:io';

import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'dialog_resetpassword.dart';
import 'profileApi.dart';

class ProfileScreen extends StatefulWidget {
  // const ProfileScreen({ Key? key }) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<Profile> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchprofile();
    print('aaaaaaaaaaaaaaaaaa$futureData');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<Profile>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  //
                  //    Text(snapshot.data.data.employeeName),
                  //  Text(snapshot.data.data.jobPosition),
                  //Text(snapshot.data.data.phone),
                  // Text(snapshot.data.data.dob),
                  //  Text(snapshot.data.data.ssn),
                  //  Text(snapshot.data.data.location),
                  /*    Text(snapshot.data.data.email) == null
                      ? new Container(
                          child: Text('------${snapshot.data.data.email}'),
                        )
                      : new Container(child: Text('.........')),
*/
                  Column(
                    children: [
                      Container(
                        height: 190,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    //    token.toString()
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
                                        BlocProvider.of<AuthenticationBloc>(
                                                context)
                                            .add(
                                          LoggedOut(),
                                        );
                                      })
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(22, 0, 7, 0),
                              child: Row(
                                children: [
                                  Container(
                                      child: AvatarView(
                                    radius: 23,
                                    //borderWidth: 8,
                                    // borderColor: Colors.yellow,
                                    avatarType: AvatarType.CIRCLE,
                                    backgroundColor: Colors.red,
                                    imagePath: snapshot.data.data.profilePic,
                                    placeHolder: Image.network(
                                      snapshot.data.data.profilePic,
                                      width: 50,
                                      height: 50,
                                      //fit: BoxFit.cover,
                                    ),
                                  )),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          snapshot.data.data.employeeName !=
                                                  null
                                              ? snapshot.data.data.employeeName
                                              : '',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontFamily: 'Nunito Sans',
                                              color: Colors.white
                                              //       color: Color.fromRGBO(13, 91, 196, 1),
                                              ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          snapshot.data.data.jobPosition != null
                                              ? snapshot.data.data.jobPosition
                                              : '',
                                          style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              // fontWeight: FontWeight.semibold,
                                              fontSize: 10.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
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
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/Union 6@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Phone',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              // fontWeight: FontWeight.semibold,
                                              fontSize: 10.0,
                                              color:
                                                  Color.fromRGBO(83, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 19),
                                        child: Text(
                                          snapshot.data.data.phone != null
                                              ? snapshot.data.data.phone
                                              : '',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  31, 33, 38, 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 1,
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 39),
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/003-envelope@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'Email',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              // fontWeight: FontWeight.semibold,
                                              fontSize: 10.0,
                                              color:
                                                  Color.fromRGBO(83, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 34),
                                        child: Text(
                                          snapshot.data.data.email != null
                                              ? snapshot.data.data.email
                                              : '',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  31, 33, 38, 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 1,
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 44),
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/001-birthday@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 11),
                                          Text(
                                            'Date of Birth',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              // fontWeight: FontWeight.semibold,
                                              fontSize: 10.0,
                                              color:
                                                  Color.fromRGBO(83, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 26),
                                        child: Text(
                                          snapshot.data.data.dob != null
                                              ? snapshot.data.data.dob
                                              : '',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  31, 33, 38, 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 1,
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/Union 7@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'SSN',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              // fontWeight: FontWeight.semibold,
                                              fontSize: 10.0,
                                              color:
                                                  Color.fromRGBO(83, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(31, 0, 20, 0),
                                        child: Text(
                                          snapshot.data.data.ssn != null
                                              ? snapshot.data.data.ssn
                                              : '',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  31, 33, 38, 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 1,
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 48),
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/placeholder@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 13),
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              // fontWeight: FontWeight.semibold,
                                              fontSize: 10.0,
                                              color:
                                                  Color.fromRGBO(83, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 24),
                                        child: Text(
                                          snapshot.data.data.location != null
                                              ? snapshot.data.data.location
                                              : '',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  31, 33, 38, 1)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3),
                                Divider(
                                  color: Colors.grey.shade200,
                                  thickness: 1,
                                ),
                                SizedBox(height: 12),
                                Padding(
                                  padding: const EdgeInsets.only(left: 44),
                                  child: Column(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "images/rotation-lock@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'Change Password',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              // fontWeight: FontWeight.semibold,
                                              fontSize: 10.0,
                                              color:
                                                  Color.fromRGBO(83, 83, 83, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 29),
                                        child: Container(
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                showDialog(
                                                    context: context,
                                                    builder: (_) {
                                                      return MyDialog();
                                                    });
                                              });
                                            },
                                            child: Text(
                                              'Reset Password',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0,
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Color.fromRGBO(
                                                    13, 91, 196, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          )),
                      SizedBox(height: 20),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              print('jjjjjjjjj');
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Style.Colors.mainColor),
                        strokeWidth: 4.0,
                      ),
                    )
                  ],
                ),
              );
            }

            // By default, show a loading spinner.
          },
        ),
      ),
    );
  }
}
