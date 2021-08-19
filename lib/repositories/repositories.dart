import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:staffer/models/models.dart';
import 'package:staffer/constants/string.dart';
import 'auth.dart';

class UserRepository {
  static String mainUrl = "http://127.0.0.1:8000/api";
  var loginUrl = '$mainUrl/login';

  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final Dio _dio = Dio();
  final Auth auth = Auth();

  Future<Object> getAssignments(String url, Object data) async {
    final String _url = mainUrl + url;
    var response =  await auth.postData(_url, data);
    // List<Assignment> assignment = Assignment.fromJson(response) as List;
    // print(assignment);
    return response;
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
    String jsonsDataString = response
        .toString(); // toString of Response's body is assigned to jsonDataString
    var _data = jsonDecode(jsonsDataString);
    return _data['token'];
  }
}
