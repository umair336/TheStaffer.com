import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:http/http.dart' as http;

import '../../repositories/repositories.dart';

Future<Detailassignment> fetchAssignmentDetail(int id) async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String? token = await storage.read(key: 'token');
  print('hhhhhhhhhhhhhhhhhhhhhh$id');
 // final url = 'https://dev5.thestaffer.com/v1/admin/employee/assignment/detail/$id';
  UserRepository request = UserRepository();
 
  final url =request.mainUrl +'/v1/admin/employee/assignment/detail/$id';
  print('dddddddddddddddddddd$token');
  String? authorization = token;
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

    return Detailassignment.fromJson(jsonDecode(response.body));
  } else {
    // Throw an exception or return a default Profile in case of an error
    throw Exception('Failed to fetch assignment details: ${response.statusCode}');
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

// class Detailassignment {
//   Detail detail;

//   Detailassignment({this.detail});

//   Detailassignment.fromJson(Map<String, dynamic> json) {
//     detail =
//         json['Detail'] != null ? new Detail.fromJson(json['Detail']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.detail != null) {
//       data['Detail'] = this.detail.toJson();
//     }
//     return data;
//   }
// }

// class Detail {
//   Record record;
//   Address address;
//   String payRate;
//   String overtimePayRate;
//   List<Shifts> shifts;
//   Null profilePic;

//   Detail(
//       {this.record,
//       this.address,
//       this.payRate,
//       this.overtimePayRate,
//       this.shifts,
//       this.profilePic});

//   Detail.fromJson(Map<String, dynamic> json) {
//     record =
//         json['record'] != null ? new Record.fromJson(json['record']) : null;
//     address =
//         json['address'] != null ? new Address.fromJson(json['address']) : null;
//     payRate = json['pay_rate'];
//     overtimePayRate = json['overtime_pay_rate'];
//     if (json['shifts'] != null) {
//       shifts = <Shifts>[];
//       json['shifts'].forEach((v) {
//         shifts.add(new Shifts.fromJson(v));
//       });
//     }
//     profilePic = json['Profile_pic'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.record != null) {
//       data['record'] = this.record.toJson();
//     }
//     if (this.address != null) {
//       data['address'] = this.address.toJson();
//     }
//     data['pay_rate'] = this.payRate;
//     data['overtime_pay_rate'] = this.overtimePayRate;
//     if (this.shifts != null) {
//       data['shifts'] = this.shifts.map((v) => v.toJson()).toList();
//     }
//     data['Profile_pic'] = this.profilePic;
//     return data;
//   }
// }

// class Record {
//   int id;
//   int number;
//   int organizationId;
//   int customerId;
//   int departmentId;
//   int worksiteId;
//   int jobPositionId;
//   int jobOrderId;

//   String startDate;
//   String endDate;
//   String status;
//   String shiftNotes;
//   String dressCode;

//   int noOfPosition;
//   String shiftTimings;
//   String customerPayRate;
//   String customerOvertimePayRate;
//   String cusStreetAdress1;
//   String cusStreetAdress2;
//   int cusZcode;
//   int cusCountry;
//   int cusState;
//   int cusCity;
//   String createdAt;
//   String updatedAt;
//   String rateUpdatedAt;
//   String experience;
//   int createdBy;
//   String customerName;
//   String departmentNames;
//   String positionName;
//   int jobid;

//   Record(
//       {this.id,
//       this.number,
//       this.organizationId,
//       this.customerId,
//       this.departmentId,
//       this.worksiteId,
//       this.jobPositionId,
//       this.jobOrderId,
//       this.startDate,
//       this.endDate,
//       this.status,
//       this.shiftNotes,
//       this.dressCode,
//       this.noOfPosition,
//       this.shiftTimings,
//       this.customerPayRate,
//       this.customerOvertimePayRate,
//       this.cusStreetAdress1,
//       this.cusStreetAdress2,
//       this.cusZcode,
//       this.cusCountry,
//       this.cusState,
//       this.cusCity,
//       this.createdAt,
//       this.updatedAt,
//       this.rateUpdatedAt,
//       this.experience,
//       this.createdBy,
//       this.customerName,
//       this.departmentNames,
//       this.positionName,
//       this.jobid});

//   Record.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     number = json['number'];
//     organizationId = json['organization_id'];
//     customerId = json['customer_id'];
//     departmentId = json['department_id'];
//     worksiteId = json['worksite_id'];
//     jobPositionId = json['job_position_id'];
//     jobOrderId = json['job_order_id'];

//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     status = json['status'];
//     shiftNotes = json['shift_notes'];
//     dressCode = json['dress_code'];

//     noOfPosition = json['no_of_position'];
//     shiftTimings = json['shift_timings'];
//     customerPayRate = json['customer_pay_rate'];
//     customerOvertimePayRate = json['customer_overtime_pay_rate'];
//     cusStreetAdress1 = json['cus_street_adress_1'];
//     cusStreetAdress2 = json['cus_street_adress_2'];
//     cusZcode = json['cus_zcode'];
//     cusCountry = json['cus_country'];
//     cusState = json['cus_state'];
//     cusCity = json['cus_city'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     rateUpdatedAt = json['rate_updated_at'];
//     experience = json['experience'];
//     createdBy = json['created_by'];
//     customerName = json['customer_name'];
//     departmentNames = json['department_names'];
//     positionName = json['position_name'];
//     jobid = json['job_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['number'] = this.number;
//     data['organization_id'] = this.organizationId;
//     data['customer_id'] = this.customerId;
//     data['department_id'] = this.departmentId;
//     data['worksite_id'] = this.worksiteId;
//     data['job_position_id'] = this.jobPositionId;
//     data['job_order_id'] = this.jobOrderId;

//     data['start_date'] = this.startDate;
//     data['end_date'] = this.endDate;
//     data['status'] = this.status;
//     data['shift_notes'] = this.shiftNotes;
//     data['dress_code'] = this.dressCode;

//     data['no_of_position'] = this.noOfPosition;
//     data['shift_timings'] = this.shiftTimings;
//     data['customer_pay_rate'] = this.customerPayRate;
//     data['customer_overtime_pay_rate'] = this.customerOvertimePayRate;
//     data['cus_street_adress_1'] = this.cusStreetAdress1;
//     data['cus_street_adress_2'] = this.cusStreetAdress2;
//     data['cus_zcode'] = this.cusZcode;
//     data['cus_country'] = this.cusCountry;
//     data['cus_state'] = this.cusState;
//     data['cus_city'] = this.cusCity;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['rate_updated_at'] = this.rateUpdatedAt;
//     data['experience'] = this.experience;
//     data['created_by'] = this.createdBy;
//     data['customer_name'] = this.customerName;
//     data['department_names'] = this.departmentNames;
//     data['position_name'] = this.positionName;
//     data['job_id'] = this.jobid;
//     return data;
//   }
// }

// class Address {
//   String address;
//   int positionCount;

//   Address({this.address, this.positionCount});

//   Address.fromJson(Map<String, dynamic> json) {
//     address = json['address'];
//     positionCount = json['position_count'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['address'] = this.address;
//     data['position_count'] = this.positionCount;
//     return data;
//   }
// }

// class Shifts {
//   int id;
//   int jobId;
//   int shiftId;
//   String timeFrom;
//   String timeTo;
//   int noOfPositions;

//   String createdAt;
//   String updatedAt;
//   String name;
//   int assignedEmployeesToShift;

//   Shifts(
//       {this.id,
//       this.jobId,
//       this.shiftId,
//       this.timeFrom,
//       this.timeTo,
//       this.noOfPositions,
//       this.createdAt,
//       this.updatedAt,
//       this.name,
//       this.assignedEmployeesToShift});

//   Shifts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     jobId = json['job_id'];
//     shiftId = json['shift_id'];
//     timeFrom = json['time_from'];
//     timeTo = json['time_to'];
//     noOfPositions = json['no_of_positions'];

//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     name = json['name'];
//     assignedEmployeesToShift = json['assigned_employees_to_shift'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['job_id'] = this.jobId;
//     data['shift_id'] = this.shiftId;
//     data['time_from'] = this.timeFrom;
//     data['time_to'] = this.timeTo;
//     data['no_of_positions'] = this.noOfPositions;

//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['name'] = this.name;
//     data['assigned_employees_to_shift'] = this.assignedEmployeesToShift;
//     return data;
//   }
// }



class Detailassignment {
 late Detail detail;

  Detailassignment({required this.detail});

  Detailassignment.fromJson(Map<String, dynamic> json) {
    detail =
        (json['Detail'] != null ? new Detail.fromJson(json['Detail']) : null)!;
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
 late Record record;
 late Address address;
 late String payRate;
 late String overtimePayRate;
 late List<Shifts> shifts;
 late List<ProfilePic> profilePic;

  Detail(
      {required this.record,
      required this.address,
      required this.payRate,
      required this.overtimePayRate,
      required this.shifts,
      required this.profilePic});

  Detail.fromJson(Map<String, dynamic> json) {
    record =
        (json['record'] != null ? new Record.fromJson(json['record']) : null)!;
    address =
        (json['address'] != null ? new Address.fromJson(json['address']) : null)!;
    payRate = json['pay_rate'];
    overtimePayRate = json['overtime_pay_rate'];
    if (json['shifts'] != null) {
      shifts = <Shifts>[];
      json['shifts'].forEach((v) {
        shifts.add(new Shifts.fromJson(v));
      });
    }
    if (json['Profile_pic'] != null) {
      profilePic = <ProfilePic>[];
      json['Profile_pic'].forEach((v) {
        profilePic.add(new ProfilePic.fromJson(v));
      });
    }
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
    if (this.profilePic != null) {
      data['Profile_pic'] = this.profilePic.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
late int id;
late int number;
late int organizationId;
late int customerId;
late int departmentId;
late int worksiteId;
late int jobPositionId;
late int jobOrderId;
late String payrollId;
late String startDate;
late String endDate;
late String status;
late String shiftNotes;
late String dressCode;
late String scheduleRepeat;
late String scheduleTime;
late String scheduleDays;
late int noOfPosition;
late String shiftTimings;
late String customerPayRate;
late String customerOvertimePayRate;
late String cusStreetAdress1;
late String cusStreetAdress2;
late int cusZcode;
late int cusCountry;
late int cusState;
late int cusCity;
late String createdAt;
late String updatedAt;
late String rateUpdatedAt;
late String experience;
late int createdBy;
late String customerName;
late String departmentNames;
late String positionName;
late String totalPosition;
late String positionCount;

  Record(
      {required this.id,
     required this.number,
     required this.organizationId,
     required this.customerId,
      required this.departmentId,
      required this.worksiteId,
      required this.jobPositionId,
      required this.jobOrderId,
      required this.payrollId,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.shiftNotes,
      required this.dressCode,
      required this.scheduleRepeat,
      required this.scheduleTime,
      required this.scheduleDays,
      required this.noOfPosition,
      required this.shiftTimings,
      required this.customerPayRate,
      required this.customerOvertimePayRate,
      required this.cusStreetAdress1,
      required this.cusStreetAdress2,
      required this.cusZcode,
      required this.cusCountry,
      required this.cusState,
      required this.cusCity,
      required this.createdAt,
      required this.updatedAt,
      required this.rateUpdatedAt,
      required this.experience,
      required this.createdBy,
      required this.customerName,
      required this.departmentNames,
      required this.positionName,
      required this.totalPosition,
      required this.positionCount});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    organizationId = json['organization_id'];
    customerId = json['customer_id'];
    departmentId = json['department_id'];
    worksiteId = json['worksite_id'];
    jobPositionId = json['job_position_id'];
    jobOrderId = json['job_order_id'];
    payrollId = json['payroll_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    shiftNotes = json['shift_notes'];
    dressCode = json['dress_code'];
    scheduleRepeat = json['schedule_repeat'];
    scheduleTime = json['schedule_time'];
    scheduleDays = json['schedule_days'];
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
    data['payroll_id'] = this.payrollId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['shift_notes'] = this.shiftNotes;
    data['dress_code'] = this.dressCode;
    data['schedule_repeat'] = this.scheduleRepeat;
    data['schedule_time'] = this.scheduleTime;
    data['schedule_days'] = this.scheduleDays;
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
late String address;
late int positionCount;

  Address({required this.address, required this.positionCount});

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
late int id;
late int jobId;
late int shiftId;
late String timeFrom;
late String timeTo;
late int noOfPositions;
late String days;
late String dates;
late String createdAt;
late String updatedAt;
late String name;
late int assignedEmployeesToShift;

  Shifts(
      {required this.id,
      required this.jobId,
      required this.shiftId,
      required this.timeFrom,
      required this.timeTo,
      required this.noOfPositions,
      required this.days,
      required this.dates,
      required this.createdAt,
      required this.updatedAt,
      required this.name,
      required this.assignedEmployeesToShift});

  Shifts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobId = json['job_id'];
    shiftId = json['shift_id'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    noOfPositions = json['no_of_positions'];
    days = json['days'];
    dates = json['dates'];
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
    data['days'] = this.days;
    data['dates'] = this.dates;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    data['assigned_employees_to_shift'] = this.assignedEmployeesToShift;
    return data;
  }
}

class ProfilePic {
late String storage;
late String name;
late String url;
late String size;
late String type;
late String originalName;

  ProfilePic(
      {required this.storage,
      required this.name,
      required this.url,
      required this.size,
      required this.type,
      required this.originalName});

  ProfilePic.fromJson(Map<String, dynamic> json) {
    storage = json['storage'];
    name = json['name'];
    url = json['url'];
    size = json['size'];
    type = json['type'];
    originalName = json['originalName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storage'] = this.storage;
    data['name'] = this.name;
    data['url'] = this.url;
    data['size'] = this.size;
    data['type'] = this.type;
    data['originalName'] = this.originalName;
    return data;
  }
}