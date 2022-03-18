import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './assignmentapi.dart';
import 'assignmentdetail.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;

class Activeassignment extends StatefulWidget {
  @override
  _ActiveassignmentState createState() => _ActiveassignmentState();
}

class _ActiveassignmentState extends State<Activeassignment> {
  Future<AssignmentApi> futureData;
  
  @override
  void initState() {
    super.initState();
    futureData = fetchassignment();
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
            /*   Row(
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
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data.data.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      if (snapshot.data.data[index].empStatus ==
                                          'Active')
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
                                                            Radius.circular(
                                                                5))),
                                                child: Column(
                                                  children: [
                                                   
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 10, 0),
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
                                                                  snapshot.data.data[index].jobPosition !=
                                                                          null
                                                                      ? snapshot
                                                                          .data
                                                                          .data[
                                                                              index]
                                                                          .jobPosition
                                                                      : ' - - - ',
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
                                                          /*   Container(
                                                        child: InkWell(
                                                          onTap: () {
                                                            /*   Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Assignmentdetail(
                                                                              jobid: snapshot.data.data[index].jobId,
                                                                            )));*/
                                                          },
                                                          child: Image.asset(
                                                            "images/Path 58358.png",
                                                            height: 15,
                                                            // fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),*/
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
                                                                : ' - - - ',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        112,
                                                                        112,
                                                                        112,
                                                                        1),
                                                                //fontWeight: FontWeight.w600,
                                                                fontSize:
                                                                    10.0)),

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
                                                              .fromLTRB(
                                                          18, 0, 20, 0),
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
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(112, 112, 112, 1),

                                                                        //fon textAlign: TextAlign.left,tWeight: FontWeight.w600,
                                                                        fontSize: 10.0)),
                                                                SizedBox(
                                                                  height: 2,
                                                                ),
                                                                Text(
                                                                    snapshot.data.data[index].startDate !=
                                                                            null
                                                                        ? DateFormat('yyyy/M/d').format(DateTime.parse(snapshot
                                                                            .data
                                                                            .data[index]
                                                                            .startDate))
                                                                        : ' - - - ',
                                                                    style: TextStyle(
                                                                        color: Color.fromRGBO(0, 0, 0, 1),
                                                                        //fontWeight: FontWeight.w600,
                                                                        fontWeight: FontWeight.bold,
                                                                        fontSize: 14.0)),
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
                                                                          fontSize: 14.0)),
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
                                            ))
                                    ],
                                  );
                                }),
                      
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
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
            )
          ],
        ),
      ),
    );
  }

  
}
