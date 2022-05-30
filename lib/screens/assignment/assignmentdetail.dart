import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/formate.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../timesheet/timesheet_screen.dart';
import './assignment_screen.dart';
import './assignmentDetailApi.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

class Assignmentdetail extends StatefulWidget {
  int jobid;
  Assignmentdetail({Key key, @required this.jobid}) : super(key: key);
  @override
  _AssignmentdetailState createState() => _AssignmentdetailState();
}

class _AssignmentdetailState extends State<Assignmentdetail> {
  Future<Detailassignment> futureData;
  Future<FormateApi> futureFormate;
  bool timeount_false = false;
  bool in_out = true;
  bool break_start_end = true;
  var workingStart;
  var workingOff;
  var breakstart;
  var breakoff;
  TimeOfDay _t;
  TimeOfDay _pp;
  var time;
  var breaak;
  Duration breaktime;
  var totaltime = [];
  var breaks;
  var Breaklist = [];
  var breakStartList = [];
  var braeakEndList = [];
  var starttime = [];
  var offtime = [];
  var now = DateTime.now();
  var payrate;
  var otPayrate;
  int jobid;
  int _selectedIndex = 2;

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
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      });
    }
  }

  //String showtimeStart = "";
  // String showtimeEnd = "";

  @override
  void initState() {
    super.initState();
    futureData = fetchAssignmentDetail(widget.jobid);
    _t = TimeOfDay.now();
    _pp = TimeOfDay.now();
    futureFormate = fetchformate();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
        onRefresh: () {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (a, b, c) => Assignmentdetail(
                        jobid: widget.jobid,
                      ),
                  transitionDuration: Duration(seconds: 0)));
          return Future.value(false);
        },
        child: SingleChildScrollView(
          child: FutureBuilder<Detailassignment>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    //

                    /*   Text(snapshot.data.data.jobPosition),
                        Text(snapshot.data.data.phone),
                        Text(snapshot.data.data.dob),
                        Text(snapshot.data.data.ssn),
                        Text(snapshot.data.data.location),
                        Text(snapshot.data.data.email) == null
                            ? new Container(
                                child: Text('------${snapshot.data.data.email}'),
                              )
                            : new Container(child: Text('.........')),*/
                    //   Text(snapshot.data.userId.toString()),
                    //   Text(snapshot.data.id.toString()),
                    //   Text(snapshot.data.title),
                    //     Text(snapshot.data.completed.toString()),
                    Column(
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
                                padding: const EdgeInsets.fromLTRB(14, 0, 7, 0),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        /* Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AssignmentScreen()));*/
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Assignments Detail',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      /* Container(
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.person,
                                            color: Colors.black,
                                            size: 35,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),*/
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            SizedBox(
                                              height: 9,
                                            ),
                                            Text(
                                              // 'Job Title will come here',

                                              snapshot.data.detail.record
                                                          .positionName !=
                                                      null
                                                  ? snapshot.data.detail.record
                                                      .positionName
                                                  : '',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    13, 91, 196, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              //  'Department name will come here',
                                              snapshot.data.detail.record
                                                          .departmentNames !=
                                                      null
                                                  ? snapshot.data.detail.record
                                                      .departmentNames
                                                  : '',

                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                // fontWeight: FontWeight.semibold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    83, 83, 83, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),

                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "images/Applicant@2x.png",
                                              height: size.height * 0.02,
                                              // fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              snapshot.data.detail.record
                                                          .customerName !=
                                                      null
                                                  ? snapshot.data.detail.record
                                                      .customerName
                                                  : ' ',
                                              //  'Customer Name Here',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.0,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "images/placeholder@2x.png",
                                              height: size.height * 0.02,
                                              // fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Container(
                                              //  height: 20,
                                              width: 130,
                                              child: Text(
                                                //'New York, NY',

                                                snapshot.data.detail.address
                                                            .address !=
                                                        null
                                                    ? snapshot.data.detail
                                                        .address.address
                                                    : ' ',

                                                style: TextStyle(
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.0,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: <Widget>[
                                        /** Positioned WIdget **/
                                        Positioned(
                                          top: 0,
                                          left: 20,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text("Start Date ",
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito Sans',
                                                      //  fontWeight: FontWeight.bold,
                                                      fontSize: 10.0,
                                                      color: Color.fromRGBO(
                                                          112, 112, 112, 1),
                                                    )),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Container(
                                                    child:
                                                        FutureBuilder<
                                                                FormateApi>(
                                                            future:
                                                                futureFormate,
                                                            builder: (context,
                                                                snapshoot) {
                                                              if (snapshoot
                                                                  .hasData) {
                                                                return Text(
                                                                  snapshot.data.detail.record
                                                                              .startDate
                                                                              .toString() !=
                                                                          null
                                                                      ? DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot
                                                                          .data
                                                                          .detail
                                                                          .record
                                                                          .startDate))
                                                                      : ' - - - ',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14.0,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            1),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Container();
                                                              }
                                                            })),
                                              ],
                                            ),
                                          ), //Icon
                                        ), //Positioned
                                        /** Positioned WIdget **/

                                        Positioned(
                                          top: 0,
                                          left: 160,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text("End Date ",
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito Sans',
                                                      //  fontWeight: FontWeight.bold,
                                                      fontSize: 10.0,
                                                      color: Color.fromRGBO(
                                                          112, 112, 112, 1),
                                                    )),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                if (snapshot.data.detail.record
                                                            .endDate ==
                                                        null ||
                                                    snapshot.data.detail.record
                                                            .endDate ==
                                                        "")
                                                  Text('')
                                                else
                                                  FutureBuilder<FormateApi>(
                                                      future: futureFormate,
                                                      builder:
                                                          (context, snapshoot) {
                                                        if (snapshoot.hasData) {
                                                          return Text(
                                                            snapshot
                                                                        .data
                                                                        .detail
                                                                        .record
                                                                        .endDate
                                                                        .toString() !=
                                                                    null
                                                                ? DateFormat(snapshoot
                                                                        .data
                                                                        .data[0]
                                                                        .currentDateFormat)
                                                                    .format(DateTime.parse(snapshot
                                                                        .data
                                                                        .detail
                                                                        .record
                                                                        .endDate))
                                                                : ' - - - ',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.0,
                                                              color: Color
                                                                  .fromRGBO(0,
                                                                      0, 0, 1),
                                                            ),
                                                          );
                                                        } else {
                                                          return Container();
                                                        }
                                                      })
                                              ],
                                            ),
                                          ),
                                        ), //Positioned
                                      ], //<Widget>[]
                                    ), //Stack
                                  ),
                                ),
                                ///////////////////////////////
                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Stack(
                                      alignment: AlignmentDirectional.center,
                                      children: <Widget>[
                                        /** Positioned WIdget **/
                                        Positioned(
                                          top: 0,
                                          left: 20,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  'Pay Rate',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    //  fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                if (snapshot
                                                        .data.detail.payRate !=
                                                    null)
                                                  Column(
                                                    children: [
                                                      Container(
                                                        child: _FunctionPayrate(
                                                            snapshot.data.detail
                                                                .payRate),
                                                      ),
                                                      Text(
                                                        //  '\$00.00/hr',

                                                        payrate,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                else
                                                  Text(
                                                    '00',
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ), //Icon
                                        ), //Positioned
                                        /** Positioned WIdget **/

                                        Positioned(
                                          top: 0,
                                          left: 160,
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  'OT Pay Rate',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    //  fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                if (snapshot.data.detail
                                                        .overtimePayRate !=
                                                    null)
                                                  Column(
                                                    children: [
                                                      Container(
                                                        child: _FunctionOtPayrate(
                                                            snapshot.data.detail
                                                                .overtimePayRate),
                                                      ),
                                                      Text(
                                                        //  '\$00.00/hr',

                                                        otPayrate,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                else
                                                  Text(
                                                    '00',
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ), //Positioned
                                      ], //<Widget>[]
                                    ), //Stack
                                  ),
                                ),

                                ///////////////////////////////////////////////////////////////////////////////////
                                SizedBox(
                                  height: 3,
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /*  ClipRRect(
                                        borderRadius: BorderRadius.circular(5.0),
                                        child: Container(
                                          height: 20,
                                          width: 70,
                                          margin: const EdgeInsets.only(
                                              left:
                                                  6.0), //Same as `blurRadius` i guess
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    27, 185, 31, 1)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    27, 185, 31, 1),
                                                offset: Offset(0.0, 0.9), //(x,y)
                                                blurRadius: 12.0,
                                                spreadRadius: 5,
                                              ),
                                            ],
                                          ),
      
                                          child: Center(
                                            child: snapshot.data.detail.record
                                                        .status !=
                                                    null
                                                ? Text(
                                                    snapshot.data.detail.record
                                                                .status ==
                                                            "Completed"
                                                        ? "Finished"
                                                        : snapshot.data.detail
                                                            .record.status,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10.0,
                                                        color: Color.fromRGBO(
                                                            27, 185, 31, 1)),
                                                  )
                                                : Container(),
                                          ),
                                        ),
                                      ),*/
                                      Padding(
                                        padding: EdgeInsets.only(right: 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Status',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                //  fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Container(
                                                height: 20,
                                                width: 70,
                                                margin: const EdgeInsets.only(
                                                    left:
                                                        6.0), //Same as `blurRadius` i guess
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Color.fromRGBO(
                                                          27, 185, 31, 1)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(
                                                          27, 185, 31, 1),
                                                      offset: Offset(
                                                          0.0, 0.9), //(x,y)
                                                      blurRadius: 12.0,
                                                      spreadRadius: 5,
                                                    ),
                                                  ],
                                                ),

                                                child: Center(
                                                  child: snapshot.data.detail
                                                              .record.status !=
                                                          null
                                                      ? Text(
                                                          snapshot
                                                                      .data
                                                                      .detail
                                                                      .record
                                                                      .status ==
                                                                  "Completed"
                                                              ? "Finished"
                                                              : snapshot
                                                                  .data
                                                                  .detail
                                                                  .record
                                                                  .status,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10.0,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      27,
                                                                      185,
                                                                      31,
                                                                      1)),
                                                        )
                                                      : Container(),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total Break Time',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                //  fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              //  '\OT Pay Rate',
                                              breaak == null
                                                  ? '0:00:00'
                                                  : breaak
                                                      .toString()
                                                      .split('.')
                                                      .first,
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Total Work Time',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                //  fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              //  '\OT Pay Rate',
                                              time == null
                                                  ? '0:00:00'
                                                  : time
                                                      .toString()
                                                      .split('.')
                                                      .first,
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),

                                /* Container(
                                  height: 150,
                                  width: 150,
                                  child: AnalogClock(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3.0, color: Colors.black),
                                        color: Colors.black,
                                        shape: BoxShape.circle),
                                    width: 100.0,
                                    isLive: true,
                                    hourHandColor: Colors.white,
                                    minuteHandColor: Colors.white,
                                    showSecondHand: false,
                                    numberColor: Colors.white,
                                    showNumbers: true,
                                    textScaleFactor: 1.5,
                                    showTicks: true,
                                    showDigitalClock: false,
                                    digitalClockColor: Colors.white,
                                    datetime: DateTime(
                                        now.year,
                                        now.month,
                                        now.day,
                                        now.hour,
                                        now.minute,
                                        now.second),
                                  ),
                                ),*/
                                if (snapshot.data.detail.record.status ==
                                    'Active')
                                  Column(children: [
                                    in_out
                                        ? Container(
                                            //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                            //   color: Color.fromRGBO(23, 197, 204, 1),
                                            height: 45,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.75,
                                            child: ElevatedButton(
                                              child: Text(
                                                'Punch-In',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                  color: Colors.white,
                                                ),
                                              ),

                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Color.fromRGBO(
                                                            13, 91, 196, 1)),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
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

                                                setState(() {
                                                  jobid = snapshot
                                                      .data.detail.record.jobid;
                                                  print(
                                                      'eeeeeeeeeeeeeeeeeeeeeeeeeee$jobid');
                                                  DialogStarttime();

                                                  //  in_out = !in_out;
                                                });
                                              },
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20, 0, 20, 0),
                                            child: Row(
                                              children: [
                                                break_start_end
                                                    ? Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.30,
                                                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                                        //   color: Color.fromRGBO(23, 197, 204, 1),
                                                        height: 45,

                                                        child: TextButton(
                                                          child: Text(
                                                            'Break Start',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.0,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      13,
                                                                      91,
                                                                      196,
                                                                      1),
                                                            ),
                                                          ),

                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Colors
                                                                            .white),
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                side: BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            13,
                                                                            91,
                                                                            196,
                                                                            1),
                                                                    width: 1),

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
                                                              break_start_end =
                                                                  !break_start_end;
                                                              breakstart =
                                                                  DateTime.now()
                                                                      .toString();

                                                              breakStartList.add(
                                                                  breakstart);
                                                              BreakStartEndTimeRequest(
                                                                  breakstart,
                                                                  breakoff,
                                                                  jobid);
                                                              //  DialogFininshTime();
                                                            });
                                                          },
                                                        ),
                                                      )
                                                    : Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.30,
                                                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                                        //   color: Color.fromRGBO(23, 197, 204, 1),
                                                        height: 45,

                                                        child: TextButton(
                                                          child: Text(
                                                            'Break End',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.0,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      13,
                                                                      91,
                                                                      196,
                                                                      1),
                                                            ),
                                                          ),

                                                          style: ButtonStyle(
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all<Color>(
                                                                        Colors
                                                                            .white),
                                                            shape: MaterialStateProperty
                                                                .all<
                                                                    RoundedRectangleBorder>(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                side: BorderSide(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            13,
                                                                            91,
                                                                            196,
                                                                            1),
                                                                    width: 1),

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
                                                              break_start_end =
                                                                  !break_start_end;
                                                              breakoff = DateTime
                                                                      .now()
                                                                  .toString();
                                                              braeakEndList.add(
                                                                  breakoff);
                                                              BreakStartEndTimeRequest(
                                                                  breakstart,
                                                                  breakoff,
                                                                  jobid);
                                                              _FunctionBreakCalutate();

                                                              //   FunctionBreakCalculate();
                                                              //  DialogFininshTime();
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                                    //   color: Color.fromRGBO(23, 197, 204, 1),
                                                    height: 45,

                                                    child: TextButton(
                                                      child: Text(
                                                        'Punch-Out',
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

                                                        setState(() {
                                                          DialogFininshTime();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ]),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                'Start Time',
                                                style: TextStyle(
                                                  fontFamily: 'Nunito Sans',
                                                  //  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: Color.fromRGBO(
                                                      112, 112, 112, 1),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              if (starttime.length >= 1)
                                                for (int i = 0;
                                                    i < starttime.length;
                                                    i++)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 9),
                                                    child: Text(
                                                      starttime[i] != null
                                                          ? DateFormat(
                                                                  'hh:mm:ss')
                                                              .format(DateTime
                                                                  .parse(
                                                                      starttime[
                                                                          i]))
                                                          : '',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                      ),
                                                    ),
                                                  ),
                                              if (starttime.length == 0)
                                                Text(
                                                  '0:00:00',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              'End Time',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                //  fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            if (offtime.length >= 1)
                                              for (int i = 0;
                                                  i < offtime.length;
                                                  i++)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 9),
                                                  child: Text(
                                                    offtime[i] != null
                                                        ? DateFormat('hh:mm:ss')
                                                            .format(
                                                                DateTime.parse(
                                                                    offtime[i]))
                                                        : '',
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    ),
                                                  ),
                                                ),
                                            if (offtime.length == 0)
                                              Text(
                                                '0:00:00',
                                                style: TextStyle(
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              'Total Time',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                //  fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            for (int i = 0;
                                                i < totaltime.length;
                                                i++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 9),
                                                child: Text(
                                                  totaltime[i]
                                                      .toString()
                                                      .split('.')
                                                      .first,
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                  ),
                                                ),
                                              ),
                                            if (totaltime.length == 0)
                                              Text(
                                                '0:00:00',
                                                style: TextStyle(
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Breaks',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Color.fromRGBO(
                                                    13, 91, 196, 1),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 8, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Start Time',
                                                style: TextStyle(
                                                  fontFamily: 'Nunito Sans',
                                                  //  fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: Color.fromRGBO(
                                                      112, 112, 112, 1),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              if (breakStartList.length >= 1)
                                                for (int i = 0;
                                                    i < breakStartList.length;
                                                    i++)
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 5, 0, 5),
                                                    child: Text(
                                                      breakStartList[i] != null
                                                          ? DateFormat(
                                                                  'hh:mm:ss')
                                                              .format(DateTime
                                                                  .parse(
                                                                      breakStartList[
                                                                          i]))
                                                          : '---',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1),
                                                      ),
                                                    ),
                                                  ),
                                              if (breakStartList.length == 0)
                                                Text(
                                                  '0:00:00',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                  ),
                                                ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              'End Time',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                //  fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            if (braeakEndList.length >= 1)
                                              for (int i = 0;
                                                  i < braeakEndList.length;
                                                  i++)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 5, 0, 5),
                                                  child: Text(
                                                    braeakEndList[i] != null
                                                        ? DateFormat('hh:mm:ss')
                                                            .format(
                                                                DateTime.parse(
                                                                    braeakEndList[
                                                                        i]))
                                                        : '---',
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    ),
                                                  ),
                                                ),
                                            if (braeakEndList.length == 0)
                                              Text(
                                                '0:00:00',
                                                style: TextStyle(
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Text(
                                              'Total Time',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                //  fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            if (Breaklist.length >= 1)
                                              for (int i = 0;
                                                  i < Breaklist.length;
                                                  i++)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 5, 0, 5),
                                                  child: Text(
                                                    Breaklist[i]
                                                        .toString()
                                                        .split('.')
                                                        .first,
                                                    style: TextStyle(
                                                      fontFamily: 'Nunito Sans',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                    ),
                                                  ),
                                                ),
                                            if (Breaklist.length == 0)
                                              Text(
                                                '0:00:00',
                                                style: TextStyle(
                                                  fontFamily: 'Nunito Sans',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                ),
                                              ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                /* Column(
                                  children: [
                                    Text(
                                      time.toString(),
                                      style: TextStyle(
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.black),
                                    ),
                                    for (int i = 0; i < Breaklist.length; i++)
                                      Text(Breaklist[i].toString())
                                  ],
                                ),*/
                                new Divider(
                                  height: 5,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Shift Details',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Sans',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color: Color.fromRGBO(
                                                    13, 91, 196, 1),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                /* TextButton(
                                  child:
                                      cmbscritta ? Text("GeoOn") : Text("GeoOFF"),
      
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromRGBO(13, 91, 196, 1)),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
      
                                        //   side: BorderSide(color: Colors.red.shade900),
                                      ),
                                    ),
                                  ),
      
                                  //    style: TextStyle(fontSize: 14)
      
                                  onPressed: () {
                                    setState(() => in_out = !in_out);
                                    setState(() => cmbscritta = !cmbscritta);
                                  },
                                ),*/

                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        snapshot.data.detail.shifts.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  'Shift Name',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    //  fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  //'Morning',
                                                  snapshot
                                                              .data
                                                              .detail
                                                              .shifts[index]
                                                              .name !=
                                                          null
                                                      ? snapshot.data.detail
                                                          .shifts[index].name
                                                      : ' ',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                  ),
                                                ),
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  'Start',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    //  fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  snapshot
                                                              .data
                                                              .detail
                                                              .shifts[index]
                                                              .timeFrom !=
                                                          null
                                                      ? snapshot
                                                          .data
                                                          .detail
                                                          .shifts[index]
                                                          .timeFrom
                                                      : ' ',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                  ),
                                                ),
                                              ],
                                            )),
                                            Expanded(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Text(
                                                  'End',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    //  fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  snapshot
                                                              .data
                                                              .detail
                                                              .shifts[index]
                                                              .timeTo !=
                                                          null
                                                      ? snapshot.data.detail
                                                          .shifts[index].timeTo
                                                      : ' ',
                                                  style: TextStyle(
                                                    fontFamily: 'Nunito Sans',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                  ),
                                                ),
                                              ],
                                            ))
                                          ],
                                        ),
                                      );
                                    }),
                                SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Shift Notes',
                                          style: TextStyle(
                                            fontFamily: 'Nunito Sans',
                                            //  fontWeight: FontWeight.bold,
                                            fontSize: 10.0,
                                            color: Color.fromRGBO(
                                                112, 112, 112, 1),
                                          ),
                                        ),
                                      ),

                                      /*  Text(
                                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt.',
                                        //  snapshot.data.detail.record.shiftNotes    .toString(),
                                        style: TextStyle(
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ),*/
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 37),
                                        child: Text(
                                          snapshot.data.detail.record
                                                      .shiftNotes !=
                                                  ' '
                                              ? snapshot
                                                  .data.detail.record.shiftNotes
                                              : 'No Note',
                                          style: TextStyle(
                                            fontFamily: 'Nunito Sans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35,
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
      ),
    );
  }

/* Future<void> _openTimePicker(BuildContext context) async {
    final t = await showTimePicker(context: context, initialTime: _t);

    if (t != null) {
      setState(() {
        _seletedTime = t.format(context);
        _t = t;
        print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $t');

        print(_seletedTime);
        in_out = !in_out;

        if (timeount_false == true) {
          timecaluculat();
          //  removeTrailingZeros();
        }

        timeount_false = true;
      });
    }
  }

  Future<void> _openTimePiker(BuildContext context) async {
    final p = await showTimePicker(context: context, initialTime: _pp);

    if (p != null) {
      setState(() {
        _seletTime = p.format(context);
        _pp = p;
        print('ccccccccccccccccccc');
        print(_seletTime);
        in_out = !in_out;
        timecaluculat();
      });
    }
  }
*/
  /*timecaluculat() {
    print('jjjjjjjjj$_seletedTime');
    print('hhhhhhhhhh$_seletTime');
    var format = DateFormat("hh:mm a");
    var starttime = format.parse(_seletedTime);
    var endtime = format.parse(_seletTime);
    print('bbbbbbbbbbbbbbbbbbbbbb$starttime and $endtime');
    if (starttime.isAfter(endtime)) {
      print('start is big');
      time = starttime.difference(endtime).toString();
      String x = "24:00";
      var f = DateFormat("hh:mm");
      var c = f.parse(x);
      var b = f.parse(time);
      print('fffffffffffffffffffff$c ffffffffffffff$b');
      time = c.difference(b).toString();
    } else if (starttime.isBefore(endtime)) {
      print('end is big');
      time = endtime.difference(starttime).toString();
    } else {
      print('difference === ${endtime.difference(starttime)}');
      time = endtime.difference(starttime).toString();
    }
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$time");
    removeTrailingZeros(); // correct val}
  }

  removeTrailingZeros() {
    time = time.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    print('gggggggggggggggggggggg$time');
    if (time.startsWith("-")) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Select accurate time "),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ));
    } else {
      return time;
    }
  }
*/
  DialogStarttime() {
    DateTime now = DateTime.now();
    String showtimeStart = DateFormat('kk:mm').format(now);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Column(
              children: [
                SizedBox(
                  height: 3,
                ),
                Text(
                  showtimeStart,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                /* DigitalClock(
                  digitAnimationStyle: Curves.elasticOut,
                  is24HourTimeFormat: false,
                  showSecondsDigit: false,
                  areaDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  hourMinuteDigitTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                  ),
                  amPmDigitTextStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),*/
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),
                        height: 35,

                        child: TextButton(
                          child: Text(
                            '  Cancel  ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Color.fromRGBO(13, 91, 196, 1),
                            ),
                          ),

                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Color.fromRGBO(13, 91, 196, 1),
                                    width: 1),

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
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),
                        height: 35,

                        child: TextButton(
                          child: Text(
                            '  Ok  ',
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
                              in_out = !in_out;
                              workingStart = DateTime.now().toString();
                              starttime.add(workingStart);

                              StartEndTimeRequest(
                                workingStart,
                                workingOff,
                                jobid,
                              );
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  DialogFininshTime() {
    DateTime now = DateTime.now();
    String showtimeEnd = DateFormat('kk:mm').format(now);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Column(
              children: [
                SizedBox(
                  height: 3,
                ),
                Text(
                  showtimeEnd,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),
                        height: 35,

                        child: TextButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Color.fromRGBO(13, 91, 196, 1),
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                    color: Color.fromRGBO(13, 91, 196, 1),
                                    width: 1),

                                //   side: BorderSide(color: Colors.red.shade900),
                              ),
                            ),
                          ),
                          onPressed: () {
                            //          Navigator.push(context,
                            //            MaterialPageRoute(builder: (context) => Profile()));

                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),
                        height: 35,

                        child: TextButton(
                          child: Text(
                            'Ok',
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
                              in_out = !in_out;
                              workingOff = DateTime.now().toString();
                              offtime.add(workingOff);
                              print(
                                  'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa$break_start_end');
                              if (break_start_end == false) {
                                breakoff = DateTime.now().toString();
                                braeakEndList.add(breakoff);
                                DateTime v1 = DateTime.parse(breakstart);
                                DateTime v2 = DateTime.parse(breakoff);
                                breaks = v1.difference(v2);
                                print(
                                    'wwwwwwwww$v1 wwwwwwwwww$v2 wwwwwwwwwwwww$breaks');

                                Breaklist.add(breaks);
                                break_start_end = !break_start_end;
                              }
                              _FunctionStartOffCalcutlate();
                              _FunctionTotalCalculate();
                              StartEndTimeRequest(
                                  workingStart, workingOff, jobid);
                              workingOff = '';
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  _FunctionBreakCalutate() {
    int prevaluebreak = 0;
    Duration total_breaks;
    print('bbbbbbb$breakstart');
    print('bbbbbbb$breakoff');
    DateTime v1 = DateTime.parse(breakstart);
    DateTime v2 = DateTime.parse(breakoff);
    breaks = v1.difference(v2);
    print('wwwwwwwww$v1 wwwwwwwwww$v2 wwwwwwwwwwwww$breaks');

    Breaklist.add(breaks);
    for (int i = 0; i < Breaklist.length; i++) {
      print('ppppp${Breaklist[i]}');
      Breaklist[i] = Breaklist[i].toString().split('.').first;
      print('aaaaaaaaaaaaaa${Breaklist[i]}');
    }

    for (int i = 0; i < Breaklist.length; i++) {
      var breakbrakdown = Breaklist[i].toString().split(':');
      total_breaks = new Duration(
          hours: int.parse(breakbrakdown[0]),
          minutes: int.parse(breakbrakdown[1]),
          seconds: int.parse(breakbrakdown[2]) + prevaluebreak);
      prevaluebreak = total_breaks.inSeconds;
      print('ooooooo$prevaluebreak');
      breaak = total_breaks.toString();
      print('/////////////////////////////////////////////////////');
    }
    breakoff = '';
  }

  _FunctionStartOffCalcutlate() {
    var timeworking;
    print('ccccc$workingStart');
    print('cccc$workingOff');
    DateTime work = DateTime.parse(workingStart);
    DateTime finish = DateTime.parse(workingOff);
    timeworking = work.difference(finish);
    totaltime.add(timeworking);
  }

  _FunctionTotalCalculate() {
    int prevalue = 0;
    int prevaluebreak = 0;
    Duration workhours;
    Duration total_breaks;
    print('qqqqqqqqqqqqqq$totaltime');
    print('qqqqqqqqqqqqqq$Breaklist');
    for (int i = 0; i < totaltime.length; i++) {
      print('ppppp${totaltime[i]}');
      totaltime[i] = totaltime[i].toString().split('.').first;
      print('aaaaaaaaaaaaaa${totaltime[i]}');
    }
    for (int i = 0; i < totaltime.length; i++) {
      print('vvvvv${totaltime[i]}');
      var totalwoking = totaltime[i].split(':');

      workhours = new Duration(
          hours: int.parse(totalwoking[0]),
          minutes: int.parse(totalwoking[1]),
          seconds: int.parse(totalwoking[2]) + prevalue);
      prevalue = workhours.inSeconds;

      print('sssssss${workhours} ssssssssssss$prevalue ssssssssssssss');
    }
    for (int i = 0; i < Breaklist.length; i++) {
      print('ppppp${Breaklist[i]}');
      Breaklist[i] = Breaklist[i].toString().split('.').first;
      print('aaaaaaaaaaaaaa${Breaklist[i]}');
    }

    for (int i = 0; i < Breaklist.length; i++) {
      var breakbrakdown = Breaklist[i].toString().split(':');
      total_breaks = new Duration(
          hours: int.parse(breakbrakdown[0]),
          minutes: int.parse(breakbrakdown[1]),
          seconds: int.parse(breakbrakdown[2]) + prevaluebreak);
      prevaluebreak = total_breaks.inSeconds;
      print('ooooooo$prevaluebreak');

      print('/////////////////////////////////////////////////////');
    }
    print('jjjjjjjjjjj$workhours jjjjjjjjjjjjjjj$total_breaks');
    if (total_breaks == null) {
      //var c = DateFormat('hh:mm:ss').parse(workhours.toString());
      time = workhours.toString();
      print('eeeeeeeeeee$time');
    } else {
      breaak = total_breaks.toString();
      var a = DateFormat('hh:mm:ss').parse(workhours.toString());
      var b = DateFormat('hh:mm:ss').parse(total_breaks.toString());
      print('sssssss$a ssssssssssssss$b');
      time = a.difference(b);
      print('eeeeeeeeeee$time');
    }
  }

  /* FunctionBreakCalculate() {
    print('bbbbbbb$breakstart');
    print('bbbbbbb$breakoff');
    breakStartList.add(breakstart);
    braeakEndList.add(breakoff);
    DateTime v1 = DateTime.parse(breakstart);
    DateTime v2 = DateTime.parse(breakoff);
    breaks = v1.difference(v2);
    print('wwwwwwwww$v1 wwwwwwwwww$v2 wwwwwwwwwwwww$breaks');
    Breaklist.add(breaks);

    // print('ddddddddd${v1.toString()}');
    // braaks = v1.difference(v2);
    //print('ooooooooo$braaks');
  }

  WorkingHoursCalculate() {
    print('ccccccccccc$workingStart');
    starttime.add(workingStart);
    print('ccccccccccc$workingOff');
    offtime.add(workingOff);
    DateTime dt1 = DateTime.parse(workingStart);
    DateTime dt2 = DateTime.parse(workingOff);
    time = dt1.difference(dt2);
    print('sssssssssssssss$time sssssssss$Breaklist');
    for (int i = 0; i < Breaklist.length; i++) {
      var timeformate = DateFormat("h:m:s");
      var dt3 = timeformate.parse(time.toString());
      var dt4 = timeformate.parse(Breaklist[i].toString());
      time = dt3.difference(dt4);
      print('gggggggggggggggggg$time');
      totaltime.add(time);

      //   print(Breaklist[i]);
    }

    //  Breaklist.clear();
    //   breakStartList.clear();
    //  braeakEndList.clear();
    // starttime.clear();
    // offtime.clear()
  }*/
  _FunctionPayrate(var a) {
    print('aaaaaaaaaaaaaaaaaaaaaaaa$a');
    //  double d = double.parse(a);
    payrate = double.parse(a).toStringAsFixed(2); // '2.35'
    //  double inDouble = double.parse(inString);
    print('dddddddddds$payrate');
  }

  _FunctionOtPayrate(var b) {
    print('aaaaaaaaaaaaaaaaaaaaaaaa$b');
    //  double d = double.parse(a);
    otPayrate = double.parse(b).toStringAsFixed(2); // '2.35'
    //  double inDouble = double.parse(inString);
    print('dddddddddds$otPayrate');
  }

  Future<http.Response> StartEndTimeRequest(
      var stime, var etime, int idjob) async {
    print(
        'ZZZZZZZZZZZZZZZZZZZ $stime ZZZZZZZZZZZZZZZZZZZz $etime ZZZZZZZZZZZZZZZZZ $idjob');
    stime = stime.toString().split('.').first.toString();
    etime = etime.toString().split('.').first.toString();
    print(
        'ZZZZZZZZZZZZZZZZZZZ $stime ZZZZZZZZZZZZZZZZZZZz $etime ZZZZZZZZZZZZZZZZZ $idjob');
    //   stime= DateFormat('kk:mm').format(stime);
    //       etime= DateFormat('kk:mm').format(etime);
    final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
    final String token = await storage.read(key: 'token');
    String authorization = token;
    var urll =
        'https://dev2.thestaffer.com/api/admin/employee/timesheet/add-timesheet';

    Map data = {
      'assignement_id': idjob,
      'start_time': stime,
      'end_time': etime
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
      print("${response.body}");
    } else {
      print('no response');
    }
    return response;
  }

  Future<http.Response> BreakStartEndTimeRequest(
      var BStime, var BEtime, int idjob) async {
    print(
        'ZZZZZZZZZZZZZZZZZZZ $BStime ZZZZZZZZZZZZZZZZZZZz $BEtime ZZZZZZZZZZZZZZZZZ $idjob');
    BStime = BStime.toString().split('.').first.toString();
    BEtime = BEtime.toString().split('.').first.toString();
    print(
        'ZZZZZZZZZZZZZZZZZZZ $BStime ZZZZZZZZZZZZZZZZZZZz $BEtime ZZZZZZZZZZZZZZZZZ $idjob');
    final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
    final String token = await storage.read(key: 'token');
    String authorization = token;
    var urll =
        'https://dev2.thestaffer.com/api/admin/employee/timesheet/add-timesheet';

    Map data = {
      'assignement_id': idjob,
      'start_time': BStime,
      'end_time': BEtime
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
      print("${response.body}");
    } else {
      print('no response');
    }
    return response;
  }
}
