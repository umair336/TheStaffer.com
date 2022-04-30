import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/formate.dart';
import './assignmentapi.dart';
import 'assignmentdetail.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;

class Upcomingassignment extends StatefulWidget {
  @override
  _UpcomingassignmentState createState() => _UpcomingassignmentState();
}

class _UpcomingassignmentState extends State<Upcomingassignment> {
  Future<AssignmentApi> futureData;
  Future<FormateApi> futureFormate;
  String valueexist = "";

  bool show = false;
  @override
  void initState() {
    super.initState();
    futureData = fetchassignment();
    futureFormate = fetchformate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            /* Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 18, 0, 18),
                    child: Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'A',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(183, 14, 105, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "images/Sorting Arrow.png",
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Z',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 255, 255, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        //      color: Colors.black,
                        //  textColor: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          //   Navigator.push(context,
                          //      MaterialPageRoute(builder: (context) => Profile()));
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                    child: Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "images/Sorting Arroww.png",
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 255, 255, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        //      color: Colors.black,
                        //  textColor: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          //   Navigator.push(context,
                          //      MaterialPageRoute(builder: (context) => Profile()));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),*/
            /* SizedBox(
              height: 450,
            ),
            Text('data')*/
            Container(
              child: FutureBuilder<AssignmentApi>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          children: <Widget>[
                             if (snapshot.data.data.length==0)
                             Padding(
                               padding: EdgeInsets.only(top: 50),
                               child: Text('No Upcoming Assignment', style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          112, 112, 112, 1)),),
                             ),
                                   
                             if(snapshot.data.data.length >= 1)
                              for (int i = 0; i < snapshot.data.data.length; i++)
                              Container(
                                child: _checkexist(
                                    snapshot.data.data[i].empStatus,
                                    snapshot.data.data[i].jobId),
                              ),
                        
                           
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.data.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      if (snapshot.data.data[index].empStatus ==
                                          'Upcoming')
                                        Padding(
                                          // padding: const EdgeInsets.all(20.0),
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 20, 5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Assignmentdetail(
                                                            jobid: snapshot
                                                                .data
                                                                .data[index]
                                                                .jobId,
                                                          )));
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  //   color: Colors.white60,
                                                  border: Border.all(
                                                      color: Color.fromRGBO(
                                                          79, 171, 247, 1)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 0, 10, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8),
                                                          child: Container(
                                                            child: Text(
                                                                snapshot
                                                                            .data
                                                                            .data[
                                                                                index]
                                                                            .jobPosition !=
                                                                        null
                                                                    ? snapshot
                                                                        .data
                                                                        .data[
                                                                            index]
                                                                        .jobPosition
                                                                    : ' ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        19.0)),
                                                            /* Text(
                                                state.assignments[index]
                                                    ['job_position'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 19.0)),*/
                                                          ),
                                                        ),
                                                        Image.asset(
                                                          "images/Path 58358@2x.png",
                                                          height: 15,
                                                          // fit: BoxFit.cover,
                                                        ),
                                                        /* Container(
                                                        child: InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Assignmentdetail(
                                                                              jobid: snapshot.data.data[index].jobId,
                                                                            )));
                                                          },
                                                          child:
                                                        ),
                                                      ),
                                                      */
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          snapshot
                                                                      .data
                                                                      .data[
                                                                          index]
                                                                      .customer !=
                                                                  null
                                                              ? snapshot
                                                                  .data
                                                                  .data[index]
                                                                  .customer
                                                              : ' ',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromRGBO(
                                                                      112,
                                                                      112,
                                                                      112,
                                                                      1),
                                                              //fontWeight: FontWeight.w600,
                                                              fontSize: 10.0)),

                                                      /* Text(
                                          state.assignments[index]['customer'],
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  112, 112, 112, 1),
                                              //fontWeight: FontWeight.w600,
                                              fontSize: 10.0)),*/
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(18, 0, 20, 0),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .baseline,
                                                            textBaseline:
                                                                TextBaseline
                                                                    .alphabetic,
                                                            children: [
                                                              Text(
                                                                  "Start Date ",
                                                                  style:
                                                                      TextStyle(
                                                                          color: Color.fromRGBO(
                                                                              112,
                                                                              112,
                                                                              112,
                                                                              1),

                                                                          //fon textAlign: TextAlign.left,tWeight: FontWeight.w600,
                                                                          fontSize:
                                                                              10.0)),
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              Container(
                                                                  child: FutureBuilder<
                                                                          FormateApi>(
                                                                      future:
                                                                          futureFormate,
                                                                      builder:
                                                                          (context,
                                                                              snapshoot) {
                                                                        if (snapshoot
                                                                            .hasData) {
                                                                          return Text(
                                                                              snapshot.data.data[index].startDate.toString() != null ? DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot.data.data[index].startDate)) : ' - - - ',
                                                                              style: TextStyle(
                                                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                                                  //fontWeight: FontWeight.w600,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontSize: 14.0));
                                                                        } else {
                                                                          return Container();
                                                                        }
                                                                      })),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 60),
                                                          child: Container(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .baseline,
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .alphabetic,
                                                              children: [
                                                                Text(
                                                                    "End Date   ",
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(112, 112, 112, 1),

                                                                        //fontWeight: FontWeight.w600,
                                                                        fontSize: 10.0)),
                                                                SizedBox(
                                                                  height: 2,
                                                                ),
                                                                snapshot
                                                                            .data
                                                                            .data[
                                                                                index]
                                                                            .endDate !=
                                                                        null
                                                                    ? Container(
                                                                        child: FutureBuilder<
                                                                                FormateApi>(
                                                                            future:
                                                                                futureFormate,
                                                                            builder: (context,
                                                                                snapshoot) {
                                                                              if (snapshoot.hasData) {
                                                                                return Text(DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot.data.data[index].endDate)),
                                                                                    //snapshot.data.data[index].startDate.toString() != null ? DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot.data.data[index].startDate)) : ' - - - ',
                                                                                    style: TextStyle(
                                                                                        color: Color.fromRGBO(0, 0, 0, 1),
                                                                                        //fontWeight: FontWeight.w600,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 14.0));
                                                                              } else {
                                                                                return Container();
                                                                              }
                                                                            }))
                                                                    : Container(
                                                                     /*   child: FutureBuilder<
                                                                                FormateApi>(
                                                                            future:
                                                                                futureFormate,
                                                                            builder:
                                                                                (context, snapshoot) {
                                                                              if (snapshoot.hasData) {
                                                                                return Text(DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot.data.data[index].jobEndDate)),
                                                                                    style: TextStyle(
                                                                                        color: Color.fromRGBO(0, 0, 0, 1),
                                                                                        //fontWeight: FontWeight.w600,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 14.0));
                                                                              } else {
                                                                                return Container();
                                                                              }
                                                                            })*/)

                                                                /*/
                                                                  Text(
                                                                      snapshot.data.data[index].endDate !=
                                                                              null
                                                                          ? DateFormat('yyyy/M/d').format(DateTime.parse(snapshot
                                                                              .data
                                                                              .data[
                                                                                  index]
                                                                              .endDate))
                                                                          : DateFormat('yyyy/M/d').format(DateTime.parse(snapshot
                                                                              .data
                                                                              .data[index]
                                                                              .jobEndDate)),
                                                                      style: TextStyle(
                                                                          color: Color.fromRGBO(0, 0, 0, 1),
                                                                          //fontWeight: FontWeight.w600,
                                                                          fontWeight: FontWeight.bold,
                                                                          fontSize: 14.0)),*/
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  );
                                }),
                            valueexist == '' ?  Text('No Upcoming Assignment', style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Nunito Sans',
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1)),)
                                : Text('')
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      print('jjjjjjjjj');
                      return Container(
                        height: MediaQuery.of(context).size.height / 1.5,
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
                  }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _checkexist(var value, var value2) {
    print('yyyyyyyyyyyyyy$value yyyyyyyyy $value2');
    // valueexist
    if (value == "Upcoming") {
      print('aaaaaaaaaaaa');
      valueexist = "qqqqqq".toString();
    } else {
      print('vvvvvvvvvv');
    }
  }
}
