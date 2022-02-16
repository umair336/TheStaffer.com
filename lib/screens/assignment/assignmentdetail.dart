import 'package:flutter/material.dart';

import './assignment_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:TheStafferEmployee/style/theme.dart' as Style;

///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

Future<Detailassignment> fetchAssignmentDetail(int id) async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String token = await storage.read(key: 'token');
  print('hhhhhhhhhhhhhhhhhhhhhh$id');
  final url =
      'https://dev2.thestaffer.com/api/admin/employees/assignments/detail/$id';
  print('dddddddddddddddddddd$token');
  String authorization = token;
  print('sssssssssssssssssssss$authorization');
  final response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $authorization'
  });
  print('Token : ${authorization}');

  print('aaaaaaaaaaaaaaaaaaaaaaaaa${response.statusCode}');
  if (response.statusCode == 200) {
    print('cccccccccccccccccccccccccccccccc${response.body}');

    print('vvvvvvvvvvvvvvvvvvv${jsonDecode(response.body)}');

    return Detailassignment.fromJson(jsonDecode(response.body));
  } else {
    print('vvvvvvvvvvvvvvvvvvv');
  }

  /*
  final url ='https://dev2.thestaffer.com/api/admin/employees/assignments/detail/2';
       if (response.statusCode == 200) {
    print('cccccccccccccccccccccccccccccccc${response.body}');

    print('vvvvvvvvvvvvvvvvvvv${jsonDecode(response.body)}');

    return Home.fromJson(jsonDecode(response.body));
  } else {
    print('vvvvvvvvvvvvvvvvvvv');
  }
*/
}

class Detailassignment {
  Detail detail;

  Detailassignment({this.detail});

  Detailassignment.fromJson(Map<String, dynamic> json) {
    detail =
        json['Detail'] != null ? new Detail.fromJson(json['Detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['Detail'] = this.detail.toJson();
    }
    return data;
  }
}

class Detail {
  Record record;
  Address address;
  String payRate;
  String overtimePayRate;
  List<Shifts> shifts;
  Null profilePic;

  Detail(
      {this.record,
      this.address,
      this.payRate,
      this.overtimePayRate,
      this.shifts,
      this.profilePic});

  Detail.fromJson(Map<String, dynamic> json) {
    record =
        json['record'] != null ? new Record.fromJson(json['record']) : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    payRate = json['pay_rate'];
    overtimePayRate = json['overtime_pay_rate'];
    if (json['shifts'] != null) {
      shifts = <Shifts>[];
      json['shifts'].forEach((v) {
        shifts.add(new Shifts.fromJson(v));
      });
    }
    profilePic = json['Profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.record != null) {
      data['record'] = this.record.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['pay_rate'] = this.payRate;
    data['overtime_pay_rate'] = this.overtimePayRate;
    if (this.shifts != null) {
      data['shifts'] = this.shifts.map((v) => v.toJson()).toList();
    }
    data['Profile_pic'] = this.profilePic;
    return data;
  }
}

class Record {
  int id;
  int number;
  int organizationId;
  int customerId;
  int departmentId;
  int worksiteId;
  int jobPositionId;
  int jobOrderId;

  String startDate;
  String endDate;
  String status;
  String shiftNotes;
  String dressCode;

  int noOfPosition;
  String shiftTimings;
  String customerPayRate;
  String customerOvertimePayRate;
  String cusStreetAdress1;
  String cusStreetAdress2;
  int cusZcode;
  int cusCountry;
  int cusState;
  int cusCity;
  String createdAt;
  String updatedAt;
  String rateUpdatedAt;
  String experience;
  int createdBy;
  String customerName;
  String departmentNames;
  String positionName;
  String totalPosition;
  String positionCount;

  Record(
      {this.id,
      this.number,
      this.organizationId,
      this.customerId,
      this.departmentId,
      this.worksiteId,
      this.jobPositionId,
      this.jobOrderId,
      this.startDate,
      this.endDate,
      this.status,
      this.shiftNotes,
      this.dressCode,
      this.noOfPosition,
      this.shiftTimings,
      this.customerPayRate,
      this.customerOvertimePayRate,
      this.cusStreetAdress1,
      this.cusStreetAdress2,
      this.cusZcode,
      this.cusCountry,
      this.cusState,
      this.cusCity,
      this.createdAt,
      this.updatedAt,
      this.rateUpdatedAt,
      this.experience,
      this.createdBy,
      this.customerName,
      this.departmentNames,
      this.positionName,
      this.totalPosition,
      this.positionCount});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    organizationId = json['organization_id'];
    customerId = json['customer_id'];
    departmentId = json['department_id'];
    worksiteId = json['worksite_id'];
    jobPositionId = json['job_position_id'];
    jobOrderId = json['job_order_id'];

    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    shiftNotes = json['shift_notes'];
    dressCode = json['dress_code'];

    noOfPosition = json['no_of_position'];
    shiftTimings = json['shift_timings'];
    customerPayRate = json['customer_pay_rate'];
    customerOvertimePayRate = json['customer_overtime_pay_rate'];
    cusStreetAdress1 = json['cus_street_adress_1'];
    cusStreetAdress2 = json['cus_street_adress_2'];
    cusZcode = json['cus_zcode'];
    cusCountry = json['cus_country'];
    cusState = json['cus_state'];
    cusCity = json['cus_city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rateUpdatedAt = json['rate_updated_at'];
    experience = json['experience'];
    createdBy = json['created_by'];
    customerName = json['customer_name'];
    departmentNames = json['department_names'];
    positionName = json['position_name'];
    totalPosition = json['total_position'];
    positionCount = json['position_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['organization_id'] = this.organizationId;
    data['customer_id'] = this.customerId;
    data['department_id'] = this.departmentId;
    data['worksite_id'] = this.worksiteId;
    data['job_position_id'] = this.jobPositionId;
    data['job_order_id'] = this.jobOrderId;

    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['shift_notes'] = this.shiftNotes;
    data['dress_code'] = this.dressCode;

    data['no_of_position'] = this.noOfPosition;
    data['shift_timings'] = this.shiftTimings;
    data['customer_pay_rate'] = this.customerPayRate;
    data['customer_overtime_pay_rate'] = this.customerOvertimePayRate;
    data['cus_street_adress_1'] = this.cusStreetAdress1;
    data['cus_street_adress_2'] = this.cusStreetAdress2;
    data['cus_zcode'] = this.cusZcode;
    data['cus_country'] = this.cusCountry;
    data['cus_state'] = this.cusState;
    data['cus_city'] = this.cusCity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rate_updated_at'] = this.rateUpdatedAt;
    data['experience'] = this.experience;
    data['created_by'] = this.createdBy;
    data['customer_name'] = this.customerName;
    data['department_names'] = this.departmentNames;
    data['position_name'] = this.positionName;
    data['total_position'] = this.totalPosition;
    data['position_count'] = this.positionCount;
    return data;
  }
}

class Address {
  String address;
  int positionCount;

  Address({this.address, this.positionCount});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    positionCount = json['position_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['position_count'] = this.positionCount;
    return data;
  }
}

class Shifts {
  int id;
  int jobId;
  int shiftId;
  String timeFrom;
  String timeTo;
  int noOfPositions;

  String createdAt;
  String updatedAt;
  String name;
  int assignedEmployeesToShift;

  Shifts(
      {this.id,
      this.jobId,
      this.shiftId,
      this.timeFrom,
      this.timeTo,
      this.noOfPositions,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.assignedEmployeesToShift});

  Shifts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    shiftId = json['shift_id'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    noOfPositions = json['no_of_positions'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    assignedEmployeesToShift = json['assigned_employees_to_shift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_id'] = this.jobId;
    data['shift_id'] = this.shiftId;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['no_of_positions'] = this.noOfPositions;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['assigned_employees_to_shift'] = this.assignedEmployeesToShift;
    return data;
  }
}

class Assignmentdetail extends StatefulWidget {
  int jobid;
  Assignmentdetail({Key key, @required this.jobid}) : super(key: key);
  @override
  _AssignmentdetailState createState() => _AssignmentdetailState();
}

class _AssignmentdetailState extends State<Assignmentdetail> {
  Future<Detailassignment> futureData;

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
                                            snapshot
                                                .data.detail.record.positionName
                                                .toString(),
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
                                                .departmentNames
                                                .toString(),
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
                                            snapshot
                                                .data.detail.record.customerName
                                                .toString(),
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
                                            snapshot.data.detail.address.address
                                                .toString(),

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
                                          Text(
                                            //   'JAN 00,2000',
                                            snapshot
                                                .data.detail.record.startDate
                                                .toString(),
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
                                          Text(
                                            //   'JAN 00,2000',
                                            snapshot.data.detail.record.endDate
                                                .toString(),
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
                                          Text(
                                            //  '\$00.00/hr',
                                            snapshot.data.detail.payRate
                                                .toString(),
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
                                          Text(
                                            //  '\OT Pay Rate',
                                            snapshot.data.detail.overtimePayRate
                                                .toString(),
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
                                            snapshot.data.detail.record.status
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.0,
                                                color: Color.fromRGBO(
                                                    27, 185, 31, 1)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    /*
                          Container(
                            height: 30,
                            //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                            //   color: Color.fromRGBO(23, 197, 204, 1),

                            child: TextButton(
                              child: Text(
                                'Active',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0,
                                    color: Color.fromRGBO(27, 185, 31, 1)),
                              ),

                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(255, 255, 255, 1),),
                                        shadowColor: MaterialStateProperty.all<Color>(Colors.green),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    side: BorderSide(
                                        color: Color.fromRGBO(27, 185, 31, 1)),
                                        
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
                          */
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
                                                snapshot.data.detail
                                                    .shifts[index].name
                                                    .toString(),
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
                                                snapshot.data.detail
                                                    .shifts[index].timeFrom
                                                    .toString(),
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
                                                snapshot.data.detail
                                                    .shifts[index].timeTo
                                                    .toString(),
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
                                    Text(
                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt.',
                                    //  snapshot.data.detail.record.shiftNotes    .toString(),
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
