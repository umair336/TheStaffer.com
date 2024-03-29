import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

import '../../repositories/repositories.dart';

Future<AssignmentApi> fetchassignment() async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String? token = await storage.read(key: 'token');
  // final url = 'https://dev2.thestaffer.com/api/admin/employees/assignments/list';
  
  //final url = 'https://dev5.thestaffer.com/v1/admin/employee/assignment/list';
   UserRepository request = UserRepository();
 
  final url =request.mainUrl +'/v1/admin/employee/assignment/list';
  print('dddddddddddddddddddd$token');
  String? authorization = token;
  print('sssssssssssssssssssss$authorization');
  //http.get(Uri.parse(StringURL))
  final response = await http.post(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $authorization'
  });
  print('Token : ${authorization}');

  print('aaaaaaaaaaaaaaaaaaaaaaaaa${response.statusCode}');
  if (response.statusCode == 200) {
    print('cccccccccccccccccccccccccccccccc${response.body}');

    print('vvvvvvvvvvvvvvvvvvv${jsonDecode(response.body)}');

    return AssignmentApi.fromJson(jsonDecode(response.body));
  } else {
    // Throw an exception or return a default Profile in case of an error
    throw Exception('Failed to fetch assignment: ${response.statusCode}');
  }
}

class AssignmentApi {
 late List<Data> data;

  AssignmentApi({required this.data});

  AssignmentApi.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
late String epsEmployment;
late String payType;
late String payMethod;
late int vendorId;
late int epsId;
late int employeePaySetupId;
late String startDate;
late String endDate;
late int empJobId;
late int jobId;
late int employeeId;
late String empStatus;
late String jobEndDate;
late int createdBy;
late String customer;
late String jobPosition;
late String employee;
late String department;
late String payroll;
late String vendorDeletedDate;
late String branch;

  Data(
      {required this.epsEmployment,
    required this.payType,
    required this.payMethod,
    required this.vendorId,
    required this.epsId,
    required this.employeePaySetupId,
    required this.startDate,
    required this.endDate,
    required this.empJobId,
    required this.jobId,
    required this.employeeId,
    required this.empStatus,
    required this.jobEndDate,
    required this.createdBy,
    required this.customer,
    required this.jobPosition,
    required this.employee,
    required this.department,
    required this.payroll,
    required this.vendorDeletedDate,
    required this.branch});

  Data.fromJson(Map<String, dynamic> json) {
    epsEmployment = json['eps_employment'];
    payType = json['pay_type'];
    payMethod = json['pay_method'];
    vendorId = json['vendor_id'];
    epsId = json['eps_id'];
    employeePaySetupId = json['employee_pay_setup_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    empJobId = json['emp_job_id'];
    jobId = json['job_id'];
    employeeId = json['employee_id'];
    empStatus = json['emp_status'];
    jobEndDate = json['job_end_date'];
    createdBy = json['created_by'];
    customer = json['customer'];
    jobPosition = json['job_position'];
    employee = json['employee'];
    department = json['department'];
    payroll = json['payroll'];
    vendorDeletedDate = json['vendor_deleted_date'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eps_employment'] = this.epsEmployment;
    data['pay_type'] = this.payType;
    data['pay_method'] = this.payMethod;
    data['vendor_id'] = this.vendorId;
    data['eps_id'] = this.epsId;
    data['employee_pay_setup_id'] = this.employeePaySetupId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['emp_job_id'] = this.empJobId;
    data['job_id'] = this.jobId;
    data['employee_id'] = this.employeeId;
    data['emp_status'] = this.empStatus;
    data['job_end_date'] = this.jobEndDate;
    data['created_by'] = this.createdBy;
    data['customer'] = this.customer;
    data['job_position'] = this.jobPosition;
    data['employee'] = this.employee;
    data['department'] = this.department;
    data['payroll'] = this.payroll;
    data['vendor_deleted_date'] = this.vendorDeletedDate;
    data['branch'] = this.branch;
    return data;
  }
}

class AssignmentApiis extends StatefulWidget {
  @override
  _AssignmentApiisState createState() => _AssignmentApiisState();
}

class _AssignmentApiisState extends State<AssignmentApiis> {
  late Future<AssignmentApi> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchassignment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<AssignmentApi>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    //
                    Text(snapshot.data!.data[0].startDate),
                    //   Text( snapshot.data.data[0].assignments[0].jobId.toString())
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
    );
  }
}
