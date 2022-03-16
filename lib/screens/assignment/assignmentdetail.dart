import 'package:flutter/material.dart';

import './assignment_screen.dart';
import './assignmentDetailApi.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;

class Assignmentdetail extends StatefulWidget {
  int jobid;
  Assignmentdetail({Key key, @required this.jobid}) : super(key: key);
  @override
  _AssignmentdetailState createState() => _AssignmentdetailState();
}

class _AssignmentdetailState extends State<Assignmentdetail> {
  Future<Detailassignment> futureData;

  bool in_out = true;

  @override
  void initState() {
    super.initState();
    futureData = fetchAssignmentDetail(widget.jobid);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AssignmentScreen()));
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.circle_outlined,
                                          color: Colors.grey,
                                          size: 45,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
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
                                                : ' - - - ',
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
                                                : ' - - - ',

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
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
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
                                                : ' - - - ',
                                            //  'Customer Name Here',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0,
                                              color: Color.fromRGBO(0, 0, 0, 1),
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
                                          Text(
                                            //'New York, NY',

                                            snapshot.data.detail.address
                                                        .address !=
                                                    null
                                                ? snapshot
                                                    .data.detail.address.address
                                                : ' - - - ',

                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 60, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            'Starting from',
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
                                            //   'JAN 00,2000',
                                            snapshot.data.detail.record
                                                        .startDate !=
                                                    null
                                                ? snapshot.data.detail.record
                                                    .startDate
                                                : ' - - - ',

                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Text(
                                            'Ending from',
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
                                            //   'JAN 00,2000',

                                            snapshot.data.detail.record
                                                        .endDate !=
                                                    null
                                                ? snapshot
                                                    .data.detail.record.endDate
                                                : ' - - - ',

                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 60, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
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
                                          Text(
                                            //  '\$00.00/hr',

                                            snapshot.data.detail.payRate != null
                                                ? snapshot.data.detail.payRate
                                                : ' - - - ',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 17),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
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
                                          Text(
                                            //  '\OT Pay Rate',

                                            snapshot.data.detail
                                                        .overtimePayRate !=
                                                    null
                                                ? snapshot
                                                    .data.detail.overtimePayRate
                                                : ' - - - ',
                                            style: TextStyle(
                                              fontFamily: 'Nunito Sans',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Status',
                                        style: TextStyle(
                                          fontFamily: 'Nunito Sans',
                                          //  fontWeight: FontWeight.bold,
                                          fontSize: 10.0,
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        height: 30,
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
                                          child: Text(
                                            snapshot.data.detail.record
                                                        .status !=
                                                    null
                                                ? snapshot
                                                    .data.detail.record.status
                                                : ' - - - ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    27, 185, 31, 1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Shift Details',
                                        style: TextStyle(
                                          fontFamily: 'Nunito Sans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(13, 91, 196, 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              in_out
                                  ? Container(
                                      //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                      //   color: Color.fromRGBO(23, 197, 204, 1),
                                      height: 45,
                                      width: 230,
                                      child: TextButton(
                                        child: Text(
                                          'Push-In',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),

                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromRGBO(
                                                      13, 91, 196, 1)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),

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
                                          });
                                        },
                                      ),
                                    )
                                  : Container(
                                      //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                                      //   color: Color.fromRGBO(23, 197, 204, 1),
                                      height: 45,
                                      width: 230,
                                      child: TextButton(
                                        child: Text(
                                          'Punch-Out',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0,
                                            color: Colors.white,
                                          ),
                                        ),

                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromRGBO(
                                                      13, 91, 196, 1)),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),

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
                                          });
                                        },
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
                                  itemCount: snapshot.data.detail.shifts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 20),
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
                                                    : ' - - - ',
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
                                                    ? snapshot.data.detail
                                                        .shifts[index].timeFrom
                                                    : ' - - - ',
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
                                                    : ' - - - ',
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
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1),
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
                                                null
                                            ? snapshot
                                                .data.detail.record.shiftNotes
                                            : 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt.',
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
