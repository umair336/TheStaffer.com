import 'dart:convert';
import 'dart:io';
import 'dart:ffi';
import 'package:TheStafferEmployee/screens/home/home_screen.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'package:intl/intl.dart';
import '../../constants/formate.dart';
import '../assignment/assignment_screen.dart';
import '../timesheet/timesheet_screen.dart';
import 'dialog_resetpassword.dart';
import 'profileApi.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

class ProfileScreen extends StatefulWidget {
  // const ProfileScreen({ Key? key }) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Profile> futureData;
  late Future<FormateApi> futureFormate;
  final password = TextEditingController();
  bool correct = false;
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    //  _selectedIndex = index;
    print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq$index');
    if (index == 0) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else if (index == 1) {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TimesheetScreen()));
      });
    } else if (index == 2) {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssignmentScreen(),
            ));
      });
    } else if (index == 3) {
      /* setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      });*/
    }
  }

  @override
  void initState() {
    super.initState();
    futureData = fetchprofile();
    futureFormate = fetchformate();
    print('aaaaaaaaaaaaaaaaaa$futureData');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: Icon(Icons.lock_clock),
                    label: 'Time Sheet',
                    backgroundColor: Style.Colors.mainColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Assignment',
                    backgroundColor: Style.Colors.mainColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                    backgroundColor: Style.Colors.mainColor),
              ],
              type: BottomNavigationBarType.fixed,
              // backgroundColor: Style.Colors.mainColor,
              // iconSize: 30,
              // selectedFontSize: 10,
              // unselectedFontSize: 8,
              unselectedItemColor: Color.fromRGBO(83, 83, 83, 1),
              selectedItemColor: Color.fromRGBO(183, 14, 105, 1),
              //   type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              //   selectedItemColor: Colors.black,
              iconSize: 25,
              onTap: _onItemTapped,
              elevation: 4),
          body: RefreshIndicator(
            backgroundColor: Colors.white,
            color: Color.fromRGBO(13, 91, 196, 1),
            //  strokeWidth: 2,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () async {
              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (a, b, c) => ProfileScreen(),
                      transitionDuration: Duration(seconds: 0)));
              return Future.value(false);
            },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SingleChildScrollView(
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
                                          padding: const EdgeInsets.fromLTRB(
                                              22, 0, 7, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Profile',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                ),
                                              ),
                                              IconButton(
                                                  icon: Icon(
                                                    EvaIcons.logOutOutline,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                AuthenticationBloc>(
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
                                          padding: const EdgeInsets.fromLTRB(
                                              22, 0, 7, 0),
                                          child: Row(
                                            children: [
                                              Container(
                                                  child: AvatarView(
                                                radius: 33,
                                                //borderWidth: 8,
                                                // borderColor: Colors.yellow,
                                                avatarType: AvatarType.CIRCLE,
                                                backgroundColor: Colors.red,
                                                imagePath: snapshot
                                                    .data!.data.profilePic,
                                                placeHolder: Image.network(
                                                  snapshot.data!.data.profilePic,
                                                  width: 50,
                                                  height: 50,
                                                  //fit: BoxFit.cover,
                                                ),
                                              )),
                                              SizedBox(
                                                width: 12,
                                              ),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Text(
                                                      snapshot.data!.data
                                                                  .employeeName !=
                                                              null
                                                          ? snapshot.data!.data
                                                              .employeeName
                                                          : '',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Colors.white
                                                          //       color: Color.fromRGBO(13, 91, 196, 1),
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      snapshot.data!.data
                                                                  .jobPosition !=
                                                              null
                                                          ? snapshot.data!.data
                                                              .jobPosition
                                                          : '',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
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
                                      padding: const EdgeInsets.fromLTRB(
                                          23, 0, 23, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 12),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50),
                                              child: Column(
                                                //  mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "images/Union 6@2x.png",
                                                        height:
                                                            size.height * 0.02,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(width: 10),
                                                      Text(
                                                        'Phone',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          // fontWeight: FontWeight.semibold,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              83, 83, 83, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 19),
                                                    child: Text(
                                                      snapshot.data!.data
                                                                  .phone !=
                                                              null
                                                          ? snapshot
                                                              .data!.data.phone
                                                          : '',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
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
                                              padding: const EdgeInsets.only(
                                                  left: 39),
                                              child: Column(
                                                //  mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "images/003-envelope@2x.png",
                                                        height:
                                                            size.height * 0.02,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        'Email',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          // fontWeight: FontWeight.semibold,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              83, 83, 83, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 34),
                                                    child: Text(
                                                      snapshot.data!.data
                                                                  .email !=
                                                              null
                                                          ? snapshot
                                                              .data!.data.email
                                                          : '',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
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
                                              padding: const EdgeInsets.only(
                                                  left: 44),
                                              child: Column(
                                                //  mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "images/001-birthday@2x.png",
                                                        height:
                                                            size.height * 0.02,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(width: 11),
                                                      Text(
                                                        'Date of Birth',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          // fontWeight: FontWeight.semibold,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              83, 83, 83, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 26),
                                                    child: Text(
                                                      snapshot.data!.data.dob
                                                                  .toString() !=
                                                              null
                                                          ? snapshot
                                                              .data!.data.dob
                                                              .toString()
                                                          : ' - - - ',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              31, 33, 38, 1)),
                                                    ),
                                                    // child: Container(
                                                    //     child: FutureBuilder<
                                                    //             FormateApi>(
                                                    //         future:
                                                    //             futureFormate,
                                                    //         builder: (context,
                                                    //             snapshoot) {
                                                    //           if (snapshoot
                                                    //               .hasData) {
                                                    //             return Text(
                                                    //               snapshot.data.data
                                                    //                           .dob
                                                    //                           .toString() !=
                                                    //                       null
                                                    //                   ? DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot
                                                    //                       .data
                                                    //                       .data
                                                    //                       .dob))
                                                    //                   : ' - - - ',
                                                    //               style: TextStyle(
                                                    //                   fontSize:
                                                    //                       12,
                                                    //                   fontWeight:
                                                    //                       FontWeight
                                                    //                           .bold,
                                                    //                   fontFamily:
                                                    //                       'Nunito Sans',
                                                    //                   color: Color
                                                    //                       .fromRGBO(
                                                    //                           31,
                                                    //                           33,
                                                    //                           38,
                                                    //                           1)),
                                                    //             );
                                                    //           } else {
                                                    //             return Container();
                                                    //           }
                                                    //         })),
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
                                            correct == false
                                                ? InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        showDialog<void>(
                                                            context: context,
                                                            barrierDismissible:
                                                                false, // user must tap button!
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                  actions: <
                                                                      Widget>[
                                                                    Column(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              14,
                                                                              0,
                                                                              14,
                                                                              0),
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                password,
                                                                            style: TextStyle(
                                                                                fontSize: 14.0,
                                                                                color: Color.fromRGBO(83, 83, 83, 1)
                                                                                // fontWeight: FontWeight.bold
                                                                                ),
                                                                            cursorColor:
                                                                                Colors.grey.shade500,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              enabledBorder: OutlineInputBorder(borderSide: new BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(5.0)),
                                                                              focusedBorder: OutlineInputBorder(borderSide: new BorderSide(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(5.0)),
                                                                              contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                                                                              labelText: "Enter Password",
                                                                              hintStyle: TextStyle(fontSize: 12.0, color: Color.fromRGBO(83, 83, 83, 1), fontWeight: FontWeight.w500),
                                                                              labelStyle: TextStyle(fontSize: 12.0, color: Color.fromRGBO(83, 83, 83, 1), fontWeight: FontWeight.w500),
                                                                            ),
                                                                            obscureText:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              15,
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              12,
                                                                              0,
                                                                              12,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                                                                  //   color: Color.fromRGBO(23, 197, 204, 1),

                                                                                  child: TextButton(
                                                                                    child: Text(
                                                                                      'Close',
                                                                                      style: TextStyle(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 14.0,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),

                                                                                    style: ButtonStyle(
                                                                                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(13, 91, 196, 1)),
                                                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                                                                        'Submit',
                                                                                        style: TextStyle(
                                                                                          fontWeight: FontWeight.bold,
                                                                                          fontSize: 14.0,
                                                                                          color: Colors.white,
                                                                                        ),
                                                                                      ),
                                                                                      style: ButtonStyle(
                                                                                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(13, 91, 196, 1)),
                                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                                                                      onPressed: () async {
                                                                                        print('dddddddddddd${password.text}');
                                                                                        String curentpassword = password.text;
                                                                                        if (curentpassword != '') {
                                                                                          // print('aaaaaaaaaaaaaaaaaaaaaaaaa');

                                                                                          password.clear();
                                                                                          // postRequestSSn(curentpassword);
                                                                                          final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
                                                                                          final String? token = await storage.read(key: 'token');

                                                                                          var urll = 'https://dev2.thestaffer.com/api/admin/get_employee_ssn';

                                                                                          Map data = {
                                                                                            'password': curentpassword,
                                                                                          };
                                                                                          //encode Map to JSON
                                                                                          var body = json.encode(data);

                                                                                          var response = await http.post(Uri.parse(urll),
                                                                                              headers: {
                                                                                                "Content-Type": "application/json",
                                                                                                'Authorization': 'Bearer $token'
                                                                                              },
                                                                                              body: body);
                                                                                          print("${response.statusCode}");
                                                                                          if (response.statusCode == 200) {
                                                                                            if (response.body.contains('true')) {
                                                                                              Navigator.pop(context);
                                                                                              //  print('uuuuuuuuuuuuuuuuuuuuuu');
                                                                                              /* Flushbar(
                                              //   title: 'Hey Ninja',
                                              message: 'Thank u',
                                              duration: Duration(seconds: 3),
                                              backgroundColor: Color.fromRGBO(183, 14, 105, 1),
                                            ).show(context);*/
                                                                                              setState(() {
                                                                                                correct = true;
                                                                                              });
                                                                                            }
                                                                                            if (response.body.contains('false')) {
                                                                                              //   print('uuuuuuuuuuuuuuuuuuuuuu');
                                                                                              Flushbar(
                                                                                                //   title: 'Hey Ninja',
                                                                                                message: 'Invalid Password',
                                                                                                duration: Duration(seconds: 3),
                                                                                                backgroundColor: Color.fromRGBO(183, 14, 105, 1),
                                                                                              ).show(context);
                                                                                              // Navigator.pop(context);
                                                                                            }
                                                                                          }
                                                                                          // print(response);

                                                                                          print("${response.body}");
                                                                                          return Future.value(response);
                                                                                        }
                                                                                        if (curentpassword == '') {
                                                                                          Flushbar(
                                                                                            //   title: 'Hey Ninja',
                                                                                            message: 'Enter Password',
                                                                                            duration: Duration(seconds: 3),
                                                                                            backgroundColor: Color.fromRGBO(183, 14, 105, 1),
                                                                                          ).show(context);
                                                                                        }
                                                                                      }),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ]);
                                                            });
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 40),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            //  mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    "images/Union 7@2x.png",
                                                                    height: size
                                                                            .height *
                                                                        0.02,
                                                                    // fit: BoxFit.cover,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          12),
                                                                  Text(
                                                                    'SSN',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      // fontWeight: FontWeight.semibold,
                                                                      fontSize:
                                                                          10.0,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              83,
                                                                              83,
                                                                              83,
                                                                              1),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 6,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            31,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child: Text(
                                                                  snapshot.data!.data
                                                                              .ssn !=
                                                                          null
                                                                      ? '***_**_${snapshot.data!.data.ssn}'
                                                                      : '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 15),
                                                            child: Icon(
                                                              Icons
                                                                  .visibility_outlined,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      14,
                                                                      105,
                                                                      1),
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      //   _showMyDialog();
                                                      setState(() {
                                                        correct = false;
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 40),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            //  mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    "images/Union 7@2x.png",
                                                                    height: size
                                                                            .height *
                                                                        0.02,
                                                                    // fit: BoxFit.cover,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          12),
                                                                  Text(
                                                                    'SSN',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      // fontWeight: FontWeight.semibold,
                                                                      fontSize:
                                                                          10.0,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              83,
                                                                              83,
                                                                              83,
                                                                              1),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 6,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            31,
                                                                            0,
                                                                            20,
                                                                            0),
                                                                child: Text(
                                                                  snapshot.data!.data
                                                                              .ssn !=
                                                                          null
                                                                      ? '${snapshot.data!.data.ssn}'
                                                                      : '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 15),
                                                            child: Icon(
                                                              Icons
                                                                  .visibility_off_outlined,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      183,
                                                                      14,
                                                                      105,
                                                                      1),
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(height: 3),
                                            Divider(
                                              color: Colors.grey.shade200,
                                              thickness: 1,
                                            ),
                                            SizedBox(height: 12),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 48),
                                              child: Column(
                                                //  mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "images/placeholder@2x.png",
                                                        height:
                                                            size.height * 0.02,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(width: 13),
                                                      Text(
                                                        'Location',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          // fontWeight: FontWeight.semibold,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              83, 83, 83, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 24),
                                                    child: Text(
                                                      snapshot.data!.data
                                                                  .location !=
                                                              null
                                                          ? snapshot.data!.data
                                                              .location
                                                          : '',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
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
                                              padding: const EdgeInsets.only(
                                                  left: 44),
                                              child: Column(
                                                //  mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "images/rotation-lock@2x.png",
                                                        height:
                                                            size.height * 0.02,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        'Change Password',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          // fontWeight: FontWeight.semibold,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              83, 83, 83, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 29),
                                                    child: Container(
                                                      child: InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder: (_) {
                                                                  return MyDialog();
                                                                });
                                                          });
                                                        },
                                                        child: Text(
                                                          'Reset Password',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            color:
                                                                Color.fromRGBO(
                                                                    13,
                                                                    91,
                                                                    196,
                                                                    1),
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
                                    valueColor:
                                        new AlwaysStoppedAnimation<Color>(
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
                ),
              ],
            ),
          )),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //   title: Text('AlertDialog '),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
                  child: TextFormField(
                    controller: password,
                    style: TextStyle(
                        fontSize: 14.0, color: Color.fromRGBO(83, 83, 83, 1)
                        // fontWeight: FontWeight.bold
                        ),
                    cursorColor: Colors.grey.shade500,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              new BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(5.0)),
                      contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                      labelText: "Enter Password",
                      hintStyle: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(83, 83, 83, 1),
                          fontWeight: FontWeight.w500),
                      labelStyle: TextStyle(
                          fontSize: 12.0,
                          color: Color.fromRGBO(83, 83, 83, 1),
                          fontWeight: FontWeight.w500),
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            /*  TextButton(
              child: Text('Confirm'),
              onPressed: () {
                print('Confirmed');
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),*/
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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

                          functionShowSSN();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  functionShowSSN() {
    print('dddddddddddd${password.text}');
    String curentpassword = password.text;
    if (curentpassword != '') {
      print('aaaaaaaaaaaaaaaaaaaaaaaaa');
      password.clear();
      postRequestSSn(curentpassword);
    } else {
      Flushbar(
        //   title: 'Hey Ninja',
        message: 'Enter password',
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ).show(context);
    }
  }

  Future<http.Response> postRequestSSn(String curentp) async {
    print('ssssssssssssssssssssssssssss$curentp');
    final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');
    String? authorization = token;
    var urll = 'https://dev5.thestaffer.com/v1/admin/get_employee_ssn';

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
      if (response.body.contains('true')) {
        Navigator.pop(context);
        print('uuuuuuuuuuuuuuuuuuuuuu');
        /* Flushbar(
          //   title: 'Hey Ninja',
          message: 'Thank u',
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(183, 14, 105, 1),
        ).show(context);*/
        setState(() {
          correct = true;
        });
      }
      if (response.body.contains('false')) {
        print('uuuuuuuuuuuuuuuuuuuuuu');
        Flushbar(
          //   title: 'Hey Ninja',
          message: 'Invalid Password',
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromRGBO(183, 14, 105, 1),
        ).show(context);
        // Navigator.pop(context);
      }
    }
    // print(response);

    print("${response.body}");
    return response;
  }
}

///////////////////////////////////////////////////
