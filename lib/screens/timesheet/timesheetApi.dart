import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
///
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

Future<TimeSheetData> timesheet() async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String token = await storage.read(key: 'token');
  final a = 2022 / 1 / 1;
  final b = 2022 / 1 / 31;

  const url =
      'https://dev2.thestaffer.com/api/admin/employees/timesheet/list?start_date=${2022 / 1 / 10}&end_date=b';
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

    //print('vvvvvvvvvvvvvvvvvvv${jsonDecode(response.body)}');

    return TimeSheetData.fromJson(jsonDecode(response.body));
  } else {
    print('vvvvvvvvvvvvvvvvvvv');
  }
}

class TimeSheetData {
  List<Timesheet> timesheet;

  TimeSheetData({this.timesheet});

  TimeSheetData.fromJson(Map<String, dynamic> json) {
    if (json['timesheet'] != null) {
      timesheet = <Timesheet>[];
      json['timesheet'].forEach((v) {
        timesheet.add(new Timesheet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timesheet != null) {
      data['timesheet'] = this.timesheet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timesheet {
  int id;
  int parentId;
  int employeeJobId;
  int customerId;
  int departmentId;
  int employeeId;
  String hoursForWeek;
  String createdAt;
  String updatedAt;
  Null invoiceId;
  int payrollStatus;
  Null ckDate;
  String overtimeHours;
  String regularHours;
  String timesheetType;
  String customerName;
  String jobPosition;

  Timesheet(
      {this.id,
      this.parentId,
      this.employeeJobId,
      this.customerId,
      this.departmentId,
      this.employeeId,
      this.hoursForWeek,
      this.createdAt,
      this.updatedAt,
      this.invoiceId,
      this.payrollStatus,
      this.ckDate,
      this.overtimeHours,
      this.regularHours,
      this.timesheetType,
      this.customerName,
      this.jobPosition});

  Timesheet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    employeeJobId = json['employee_job_id'];
    customerId = json['customer_id'];
    departmentId = json['department_id'];
    employeeId = json['employee_id'];
    hoursForWeek = json['hours_for_week'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    invoiceId = json['invoice_id'];
    payrollStatus = json['payroll_status'];
    ckDate = json['ck_date'];
    overtimeHours = json['overtime_hours'];
    regularHours = json['regular_hours'];
    timesheetType = json['timesheet_type'];
    customerName = json['customer_name'];
    jobPosition = json['job_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['employee_job_id'] = this.employeeJobId;
    data['customer_id'] = this.customerId;
    data['department_id'] = this.departmentId;
    data['employee_id'] = this.employeeId;
    data['hours_for_week'] = this.hoursForWeek;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['invoice_id'] = this.invoiceId;
    data['payroll_status'] = this.payrollStatus;
    data['ck_date'] = this.ckDate;
    data['overtime_hours'] = this.overtimeHours;
    data['regular_hours'] = this.regularHours;
    data['timesheet_type'] = this.timesheetType;
    data['customer_name'] = this.customerName;
    data['job_position'] = this.jobPosition;
    return data;
  }
}

class TimeSheetApi extends StatefulWidget {
  @override
  _TimeSheetApiState createState() => _TimeSheetApiState();
}

class _TimeSheetApiState extends State<TimeSheetApi> {
  Future<TimeSheetData> futureData;
  @override
  void initState() {
    super.initState();
    futureData = timesheet();
    print('aaaaaaaaaaaaaaaaaa$futureData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 15),
          Container(
            color: Colors.blueAccent,
            child: TextButton(
              child: Text("Button"),
              onPressed: () {
                timesheet();
              },
            ),
          ),
          FutureBuilder<TimeSheetData>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data.timesheet[0].id.toString())
                    /* Text(
                        "employee_job_id   ==  ${snapshot.data.data.records[0].employeeJobId}"),
                    Text(
                        "employee_id   ==  ${snapshot.data.data.records[0].employeeId}"),
                    Text(
                        "customer_id   ==  ${snapshot.data.data.records[0].customerId}"),
                    Text(
                        "billing_rate   ==  ${snapshot.data.data.records[0].billingRate}"),
                    Text(
                        "overtime_billing_rate   ==  ${snapshot.data.data.records[0].overtimeBillingRate}"),
                    Text(
                        "Pay Rate   ==  ${snapshot.data.data.records[0].payRate}"),
                    Text(
                        "over_time pay rate   ==  ${snapshot.data.data.records[0]..overtimePayRate}"),
                    Text(
                        "emplyee name ==  ${snapshot.data.data.records[0].empName}"),
                    Text(
                        "Job number   ==  ${snapshot.data.data.records[0].jobNumber}"),
                    Text(
                        "Job Position   ==  ${snapshot.data.data.records[0].jobPosition}"),
                    Text(
                        "timesheet table id   ==  ${snapshot.data.data.records[0].timesheetTableId}"),
                    Text(
                        "-----------------------------------time_sheet_weekly----------------------"),
                    Text(
                        "id  == ${snapshot.data.data.records[0].timeSheetWeekly.id}"),
                    Text(
                        "parent id  == ${snapshot.data.data.records[0].timeSheetWeekly.parentId}"),
                    Text(
                        "employ job id  == ${snapshot.data.data.records[0].timeSheetWeekly.employeeJobId}"),
                    Text(
                        "customer id  == ${snapshot.data.data.records[0].timeSheetWeekly.customerId}"),
                    Text(
                        "department id  == ${snapshot.data.data.records[0].timeSheetWeekly.departmentId}"),
                    Text(
                        "employee id  == ${snapshot.data.data.records[0].timeSheetWeekly.employeeId}"),
                    Text(
                        "hours for week  == ${snapshot.data.data.records[0].timeSheetWeekly.hoursForWeek}"),
                    Text(
                        "created at  == ${snapshot.data.data.records[0].timeSheetWeekly.createdAt}"),
                    Text(
                        "updated  at  == ${snapshot.data.data.records[0].timeSheetWeekly.updatedAt}"),
                    Text(
                        "payroll  status  == ${snapshot.data.data.records[0].timeSheetWeekly.payrollStatus}"),
                    Text(
                        "week  type  == ${snapshot.data.data.records[0].timeSheetWeekly.timesheetType}"),*/
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
    );
  }
}
