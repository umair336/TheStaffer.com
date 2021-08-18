import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:staffer/models/models.dart';
import 'package:staffer/constants/string.dart';
import 'auth.dart';

class UserRepository {
  static String mainUrl = "http://127.0.0.1:8000";
  var loginUrl = '$mainUrl/api/login';

  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final Dio _dio = Dio();
  final Auth auth = Auth();

  Future<String> getAssignments(String url, Object data) async {

     final String token = await storage.read(key: 'token');
     Response response = await _dio.post(
      mainUrl + url,
      data: {
      "employee_id": "0",
      "date_format": "d%2Fm%2FY",
      "employee": "",
      "branch": "",
      "job_position": "",
      },
      options: Options(
        headers: {
          'Authorization': "Bearer ${token}",
        },
      ),
    );


    // var response =  await auth.postData(url, data);


    print(response);

    // List<Assignment> assignment = Assignment.fromJson(response) as List;
    return 'package';
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
    storage.deleteAll();
  }

  Future<String> login(String phone, String password) async {
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
    String jsonsDataString = response.toString(); // toString of Response's body is assigned to jsonDataString
    var _data = jsonDecode(jsonsDataString);
    return _data['token'];
  }
}
