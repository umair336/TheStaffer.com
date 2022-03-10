import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
///
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

Future<TimeSheetData> timesheet(String dateStart, String dateEnd) async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String token = await storage.read(key: 'token');
  String a = '2022/1/2';
  String b = '2022/2/11';

  var url =
      'https://dev2.thestaffer.com/api/admin/employee/timesheet/list?start_date=$dateStart&end_date=$dateEnd';
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
    // print('iiiiiiiiiiiiiiiiiiiiiiiiiiii${response.statusCode}');
    print('cccccccccccccccccccccccccccccccc${jsonDecode(response.body)}');
    //  setReceivedText(response.body);

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
 
  int overRate;
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
      
      this.overRate,
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
   
    overRate = json['over_rate'];
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

    data['over_rate'] = this.overRate;
    data['job_position'] = this.jobPosition;
    return data;
  }
}
