import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

class Auth {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<String> getData(String url) async {
    Response response = await _dio.get(
      url,
      options: Options(
        headers: {
          'accept': '*/*',
          'Accept': 'application/json',
          'contentType': 'multipart/form-data',
          'Authorization': "Bearer ${storage.read(key: 'token')}",
        },
      ),
    );
    String jsonsDataString = response.toString();
    print(jsonsDataString);
    print('----------here-------------1');
    var _data = jsonDecode(jsonsDataString);
    return _data;
  }

  Future<Object> postData(String url, Object data) async {
    final String token = await storage.read(key: 'token');
    Response response = await _dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'accept': '*/*',
          'Accept': 'application/json',
          'contentType': 'multipart/form-data',
          'Authorization': "Bearer ${token}",
        },
      ),
    );
    return response;
  }
}
