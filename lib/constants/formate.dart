import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

Future<FormateApi> fetchformate() async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String token = await storage.read(key: 'token');
  final url = 'https://dev2.thestaffer.com/api/admin/get-general-setting-and-profile-data';
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

    return FormateApi.fromJson(jsonDecode(response.body));
  } else {
    print('vvvvvvvvvvvvvvvvvvv');
  }
}

class FormateApi {
  List<Data> data;

  FormateApi({this.data});

  FormateApi.fromJson(Map<String, dynamic> json) {
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
  String empName;
  String empEmail;

  String currentDateFormat;
  String currencyformat;

  Data(
      {this.empName,
      this.empEmail,
  
      this.currentDateFormat,
      this.currencyformat});

  Data.fromJson(Map<String, dynamic> json) {
    empName = json['emp_name'];
    empEmail = json['emp_email'];
   
    currentDateFormat = json['current_date_format'];
    currencyformat = json['currencyformat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_name'] = this.empName;
    data['emp_email'] = this.empEmail;
  
    data['current_date_format'] = this.currentDateFormat;
    data['currencyformat'] = this.currencyformat;
    return data;
  }
}
