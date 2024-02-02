import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;
import 'auth.dart';
import 'dart:ffi';
class UserRepository {
  //static String mainUrl = "http://127.0.0.1:8000/api";
 // static String mainUrl = "https://dev5.thestaffer.com/api";
  var mainUrl = "https://dev5.thestaffer.com";
  //var loginUrl = '$mainUrl/login';

  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final Dio _dio = Dio();
  final Auth auth = Auth();

  Future<List<dynamic>> getTimesheets(String url, Object data) async {
    final String _url = mainUrl + url;
    Response response = await auth.postData(_url, data);
    return response.data['data'];
  }

  Future<List> getAssignments(String url, Object data) async {
    final String _url = mainUrl + url;
    Response response = await auth.postData(_url, data);
    print('${response.data}');
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

  Future<String?> login(String phone, String password) async {
    // var loginUrl =   "https://dev5.thestaffer.com/v1/login";
      var loginUrl =  mainUrl+ "/api/login";
    Response response;
    try {
      response = await _dio.post(
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
      if (response.statusCode == 200) {
        print("${response.data['data']['token']}");
        return response.data['data']['token'];
        // var _data = jsonDecode(response.data['data']['token']);

      } else {
    // Throw an exception or return a default Profile in case of an error
    throw Exception('Failed to login: ${response.statusCode}');
  }
    } on DioError catch (error) {
      var apiresponse = error.response!.data['message'];
      print('$apiresponse');
      LoginAddMeesage(apiresponse);
    }
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
  ////////////////// GetLogin Issue /////////////////

  Future<void> LoginAddMeesage(String val) async {
    print('$val');
    await storage.write(key: 'LoginError', value: val);
  }

  Future<void> LoginMessageShow() async {
    var va = await storage.read(key: 'LoginError');
    print('$va');
  }
}
