import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

Future<Home> fetchhome() async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String token = await storage.read(key: 'token');
  final url = 'https://dev5.thestaffer.com/v1/dashboard';
  print('dddddddddddddddddddd$token');
  String authorization = token;
  print('sssssssssssssssssssss$authorization');
  final response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $authorization'
  });
  print('Token : ${authorization}');

  print('aaaaaaaaaaaaaaaaaaaaaaaaa${response.statusCode}');
  if (response.statusCode == 200) {
    print('cccccccccccccccccccccccccccccccc${response.body}');

    print('vvvvvvvvvvvvvvvvvvv${jsonDecode(response.body)}');

    return Home.fromJson(jsonDecode(response.body));
  } else {
    print('vvvvvvvvvvvvvvvvvvv');
  }
}

class Home {
  var message;
  var error;
  int code;
  Data data;

  Home({this.message, this.error, this.code, this.data});

  Home.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  var totalWeeklyHours;
  var prevWeeklyHours;
  var employeeName;
  var profilePic;
 List<Assignments> assignments;
  var earnings;
  var prevEarnings;
  var pendingBalance;
  var totalShifts;
  var startDate;
  var endDate;
  var prevWeekStart;
  var prevWeekEnd;
  var currentDateFormat;
  var currencyFormat;

  Data(
      {this.totalWeeklyHours,
      this.prevWeeklyHours,
      this.employeeName,
      this.profilePic,
     this.assignments,
      this.earnings,
      this.prevEarnings,
      this.pendingBalance,
      this.totalShifts,
      this.startDate,
      this.endDate,
      this.prevWeekStart,
      this.prevWeekEnd,
      this.currentDateFormat,
      this.currencyFormat});

  Data.fromJson(Map<String, dynamic> json) {
    totalWeeklyHours = json['total_weekly_hours'];
    prevWeeklyHours = json['prev_weekly_hours'];
    employeeName = json['employee_name'];
    profilePic = json['profile_pic'];
    if (json['assignments'] != null) {
      assignments = <Assignments>[];
      json['assignments'].forEach((v) {
        assignments.add(new Assignments.fromJson(v));
      });
    }
    earnings = json['earnings'];
    prevEarnings = json['prev_earnings'];
    pendingBalance = json['pending_balance'];
    totalShifts = json['total_shifts'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    prevWeekStart = json['prev_week_start'];
    prevWeekEnd = json['prev_week_end'];
    currentDateFormat = json['current_date_format'];
    currencyFormat = json['currency_format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_weekly_hours'] = this.totalWeeklyHours;
    data['prev_weekly_hours'] = this.prevWeeklyHours;
    data['employee_name'] = this.employeeName;
    data['profile_pic'] = this.profilePic;
    // if (this.assignments != null) {
    //   data['assignments'] = this.assignments.map((v) => v.toJson()).toList();
    // }
    data['earnings'] = this.earnings;
    data['prev_earnings'] = this.prevEarnings;
    data['pending_balance'] = this.pendingBalance;
    data['total_shifts'] = this.totalShifts;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['prev_week_start'] = this.prevWeekStart;
    data['prev_week_end'] = this.prevWeekEnd;
    data['current_date_format'] = this.currentDateFormat;
    data['currency_format'] = this.currencyFormat;
    return data;
  }
}

class Assignments {
  var number;
  var id;
  var jobId;
  var employeeId;
  var employeePaySetupId;
  var employment;
  var payRate;
  var overtimePayRate;
  var status;
  var agencyMargin;
  var customerPayRate;
  var customerOvertimePayRate;
  var endDate;
  var startDate;
  var createdAt;
  var updatedAt;
  var createdBy;
  var employeeJobId;
  var jobTitle;
  var employeeName;
  var customer;
  var customerName;

  Assignments(
      {this.number,
      this.id,
      this.jobId,
      this.employeeId,
      this.employeePaySetupId,
      this.employment,
      this.payRate,
      this.overtimePayRate,
      this.status,
      this.agencyMargin,
      this.customerPayRate,
      this.customerOvertimePayRate,
      this.endDate,
      this.startDate,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.employeeJobId,
      this.jobTitle,
      this.employeeName,
      this.customer,
      this.customerName});

  Assignments.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    id = json['id'];
    jobId = json['job_id'];
    employeeId = json['employee_id'];
    employeePaySetupId = json['employee_pay_setup_id'];
    employment = json['employment'];
    payRate = json['pay_rate'];
    overtimePayRate = json['overtime_pay_rate'];
    status = json['status'];
    agencyMargin = json['agency_margin'];
    customerPayRate = json['customer_pay_rate'];
    customerOvertimePayRate = json['customer_overtime_pay_rate'];
    endDate = json['end_date'];
    startDate = json['start_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    employeeJobId = json['employee_job_id'];
    jobTitle = json['job_title'];
    employeeName = json['employee_name'];
    customer = json['customer'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['id'] = this.id;
    data['job_id'] = this.jobId;
    data['employee_id'] = this.employeeId;
    data['employee_pay_setup_id'] = this.employeePaySetupId;
    data['employment'] = this.employment;
    data['pay_rate'] = this.payRate;
    data['overtime_pay_rate'] = this.overtimePayRate;
    data['status'] = this.status;
    data['agency_margin'] = this.agencyMargin;
    data['customer_pay_rate'] = this.customerPayRate;
    data['customer_overtime_pay_rate'] = this.customerOvertimePayRate;
    data['end_date'] = this.endDate;
    data['start_date'] = this.startDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['employee_job_id'] = this.employeeJobId;
    data['job_title'] = this.jobTitle;
    data['employee_name'] = this.employeeName;
    data['customer'] = this.customer;
    data['customer_name'] = this.customerName;
    return data;
  }
}

// class Assignments {
//   int number;
//   int id;
//   int jobId;
//   int employeeId;
//   int employeePaySetupId;
//   String employment;
//   String payRate;
//   String overtimePayRate;
//   String status;
//   String agencyMargin;
//   String customerPayRate;
//   String customerOvertimePayRate;
//   String endDate;
//   String startDate;
//   String createdAt;
//   String updatedAt;
//   int createdBy;
//   int employeeJobId;
//   String jobTitle;
//   String employeeName;
//   int customer;
//   String customerName;

//   Assignments(
//       {this.number,
//       this.id,
//       this.jobId,
//       this.employeeId,
//       this.employeePaySetupId,
//       this.employment,
//       this.payRate,
//       this.overtimePayRate,
//       this.status,
//       this.agencyMargin,
//       this.customerPayRate,
//       this.customerOvertimePayRate,
//       this.endDate,
//       this.startDate,
//       this.createdAt,
//       this.updatedAt,
//       this.createdBy,
//       this.employeeJobId,
//       this.jobTitle,
//       this.employeeName,
//       this.customer,
//       this.customerName});

//   Assignments.fromJson(Map<String, dynamic> json) {
//     number = json['number'];
//     id = json['id'];
//     jobId = json['job_id'];
//     employeeId = json['employee_id'];
//     employeePaySetupId = json['employee_pay_setup_id'];
//     employment = json['employment'];
//     payRate = json['pay_rate'];
//     overtimePayRate = json['overtime_pay_rate'];
//     status = json['status'];
//     agencyMargin = json['agency_margin'];
//     customerPayRate = json['customer_pay_rate'];
//     customerOvertimePayRate = json['customer_overtime_pay_rate'];
//     endDate = json['end_date'];
//     startDate = json['start_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     createdBy = json['created_by'];
//     employeeJobId = json['employee_job_id'];
//     jobTitle = json['job_title'];
//     employeeName = json['employee_name'];
//     customer = json['customer'];
//     customerName = json['customer_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['number'] = this.number;
//     data['id'] = this.id;
//     data['job_id'] = this.jobId;
//     data['employee_id'] = this.employeeId;
//     data['employee_pay_setup_id'] = this.employeePaySetupId;
//     data['employment'] = this.employment;
//     data['pay_rate'] = this.payRate;
//     data['overtime_pay_rate'] = this.overtimePayRate;
//     data['status'] = this.status;
//     data['agency_margin'] = this.agencyMargin;
//     data['customer_pay_rate'] = this.customerPayRate;
//     data['customer_overtime_pay_rate'] = this.customerOvertimePayRate;
//     data['end_date'] = this.endDate;
//     data['start_date'] = this.startDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['created_by'] = this.createdBy;
//     data['employee_job_id'] = this.employeeJobId;
//     data['job_title'] = this.jobTitle;
//     data['employee_name'] = this.employeeName;
//     data['customer'] = this.customer;
//     data['customer_name'] = this.customerName;
//     return data;
//   }
// }

// class Home {
//   String message;
//   bool error;
//   int code;
//   Data data;

//   Home({this.message, this.error, this.code, this.data});

//   Home.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     error = json['error'];
//     code = json['code'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['message'] = this.message;
//     data['error'] = this.error;
//     data['code'] = this.code;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int totalWeeklyHours;
//   int prevWeeklyHours;
//   String employeeName;
//   String profilePic;
//   // List<Null>? assignments;
//   int earnings;
//   int prevEarnings;
//   int pendingBalance;
//   int totalShifts;
//   String startDate;
//   String endDate;
//   String prevWeekStart;
//   String prevWeekEnd;
//   String currentDateFormat;
//   String currencyFormat;

//   Data(
//       {this.totalWeeklyHours,
//       this.prevWeeklyHours,
//       this.employeeName,
//       this.profilePic,
//       this.earnings,
//       this.prevEarnings,
//       this.pendingBalance,
//       this.totalShifts,
//       this.startDate,
//       this.endDate,
//       this.prevWeekStart,
//       this.prevWeekEnd,
//       this.currentDateFormat,
//       this.currencyFormat});

//   Data.fromJson(Map<String, dynamic> json) {
//     totalWeeklyHours = json['total_weekly_hours'];
//     prevWeeklyHours = json['prev_weekly_hours'];
//     employeeName = json['employee_name'];
//     profilePic = json['profile_pic'];
//     // if (json['assignments'] != null) {
//     //   assignments = <Null>[];
//     //   json['assignments'].forEach((v) {
//     //     assignments!.add(new Null.fromJson(v));
//     //   });
//     // }
//     earnings = json['earnings'];
//     prevEarnings = json['prev_earnings'];
//     pendingBalance = json['pending_balance'];
//     totalShifts = json['total_shifts'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     prevWeekStart = json['prev_week_start'];
//     prevWeekEnd = json['prev_week_end'];
//     currentDateFormat = json['current_date_format'];
//     currencyFormat = json['currency_format'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total_weekly_hours'] = this.totalWeeklyHours;
//     data['prev_weekly_hours'] = this.prevWeeklyHours;
//     data['employee_name'] = this.employeeName;
//     data['profile_pic'] = this.profilePic;
//     // if (this.assignments != null) {
//     //   data['assignments'] = this.assignments!.map((v) => v.toJson()).toList();
//     // }
//     data['earnings'] = this.earnings;
//     data['prev_earnings'] = this.prevEarnings;
//     data['pending_balance'] = this.pendingBalance;
//     data['total_shifts'] = this.totalShifts;
//     data['start_date'] = this.startDate;
//     data['end_date'] = this.endDate;
//     data['prev_week_start'] = this.prevWeekStart;
//     data['prev_week_end'] = this.prevWeekEnd;
//     data['current_date_format'] = this.currentDateFormat;
//     data['currency_format'] = this.currencyFormat;
//     return data;
//   }
// }

class Homeapi extends StatefulWidget {
  @override
  _HomeapiState createState() => _HomeapiState();
}

class _HomeapiState extends State<Homeapi> {
  Future<Home> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchhome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('fffffffffffffffff'),
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  fetchhome();
                },
              ),
            ),
            FutureBuilder<Home>(
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
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  print('jjjjjjjjj');
                  return CircularProgressIndicator();
                }

                // By default, show a loading spinner.
              },
            ),
          ],
        ),
      ),
    );
  }
}
