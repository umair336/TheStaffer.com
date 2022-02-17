import 'dart:async';
import 'dart:convert';


///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:http/http.dart' as http;

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