import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'package:staffer/models/models.dart';
import 'package:staffer/constants/string.dart';
import 'auth.dart';

class UserRepository {
  static String mainUrl = "https://dev2.thestaffer.com/api";
  var loginUrl = '$mainUrl/login';

  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final Dio _dio = Dio();
  final Auth auth = Auth();

  Future<List> getAssignments(String url, Object data) async {
    final String _url = mainUrl + url;
    print('before request');
    Response response =  await auth.postData(_url, data);
    print(response.data['data'].length);
    // try {
    // List<Assignment> assignment = response.data['data'];
    // print(assignment);
    // } catch (error) {
    //   print(error.toString());
    // }
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
