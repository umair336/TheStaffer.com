import 'package:flutter/material.dart';
import './past.dart';
import './assignment_screen.dart';

class Assignmentdetail extends StatefulWidget {
  @override
  _AssignmentdetailState createState() => _AssignmentdetailState();
}

class _AssignmentdetailState extends State<Assignmentdetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                                    builder: (context) => AssignmentScreen()));
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
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                SizedBox(
                                  height: 9,
                                ),
                                Text(
                                  'Job Title will come here',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Nunito Sans',
                                    color: Color.fromRGBO(13, 91, 196, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Department name will come here',
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
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  'Customer Name Here',
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
                                  'New York, NY',
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
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 60, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  'Starting from',
                                  style: TextStyle(
                                    fontFamily: 'Nunito Sans',
                                    //  fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                ),
                                Text(
                                  'JAN 00,2000',
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
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  'Ending from',
                                  style: TextStyle(
                                    fontFamily: 'Nunito Sans',
                                    //  fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                ),
                                Text(
                                  'JAN 00,2000',
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
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 60, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  'Pay Rate',
                                  style: TextStyle(
                                    fontFamily: 'Nunito Sans',
                                    //  fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                ),
                                Text(
                                  '\$00.00/hr',
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
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  'OT Pay Rate',
                                  style: TextStyle(
                                    fontFamily: 'Nunito Sans',
                                    //  fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                  ),
                                ),
                                Text(
                                  '\OT Pay Rate',
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
                      height: 20,
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
                                color: Color.fromRGBO(112, 112, 112, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
