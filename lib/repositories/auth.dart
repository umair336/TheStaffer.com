import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

class Auth {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<Object> getData(String url) async {
    final String token = await storage.read(key: 'token');
    Response response = await _dio.get(
      url,
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
