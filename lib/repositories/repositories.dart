import 'dart:convert';
import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:TheStafferEmployee/models/models.dart';
import 'package:TheStafferEmployee/constants/string.dart';
import 'auth.dart';

class UserRepository {
  //static String mainUrl = "http://127.0.0.1:8000/api";
  static String mainUrl = "https://dev2.thestaffer.com/api";
  //var loginUrl = '$mainUrl/login';
  var loginUrl = "https://dev2.thestaffer.com/v1/user/login";

  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final Dio _dio = Dio();
  final Auth auth = Auth();

  Future<List> getTimesheets(String url, Object data) async {
    final String _url = mainUrl + url;
    Response response = await auth.postData(_url, data);

    return response.data['data'];
  }

  Future<List> getAssignments(String url, Object data) async {
    final String _url = mainUrl + url;
    Response response = await auth.postData(_url, data);
    print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk${response.data}');
    return response.data['data'];
  }

  Future<List> getHomeData(String url) async {
    final String _url = mainUrl + url;
    Response response = await auth.getData(_url);
    return response.data['data'];
  }

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    // storage.deleteAll();
  }

  Future<String> login(String phone, String password) async {
    try {
      Response response = await _dio.post(
        loginUrl,
        data: {
          "email": phone,
          "password": password,
        },
        options: Options(
          headers: {
            'accept': '*/*',
            'Accept': 'application/json',
            'contentType': 'multipart/form-data',
          },
        ),
      );
      //  print('KKKKKKKKKKKKKKKKKKKKKKKKKKKKK${response.statusMessage }');
      // toString of Response's body is assigned to jsonDataString
      if (response.statusCode == 200) {
        print("GGGGGGGGGGGGGGGGGGGGGGG${response.data['data']['token']}");
        return response.data['data']['token'];
        // var _data = jsonDecode(response.data['data']['token']);

      } else {
        return "request failed";
      }
    } catch (e) {
      print('sssssssssssssssss${e}');
    }
    // print(response);
    // var _data = jsonDecode(jsonsDataString);

    //  return _data['token'];
  }
  /////////////////////////////////////////////////

  Future<void> first(String val) async {
    await storage.write(key: 'firsttime', value: val);
  }

  Future<bool> hasfirsr() async {
    var va = await storage.read(key: 'firsttime');
    if (va != null) {
      return true;
    } else {
      return false;
    }
  }
}


/*




 else if (response.statusCode == 422) {
      BuildContext context;
      return Flushbar(
        // title: 'Hey Ninja',
        message: 'New and confirm password do not match.',
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ).show(context);

      */