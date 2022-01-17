import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///import 'package:staffer/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

Future<Profile> fetchprofile() async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String token = await storage.read(key: 'token');
  const url = 'https://dev2.thestaffer.com/api/admin/getprofile';
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

    return Profile.fromJson(jsonDecode(response.body));
  } else {
    print('vvvvvvvvvvvvvvvvvvv');
  }
}

class Profile {
  Data data;

  Profile({this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String employeeName;
  String jobPosition;
  String phone;
  String email;
  String dob;
  String ssn;
  String location;

  Data(
      {this.employeeName,
      this.jobPosition,
      this.phone,
      this.email,
      this.dob,
      this.ssn,
      this.location});

  Data.fromJson(Map<String, dynamic> json) {
    employeeName = json['employee_name'];
    jobPosition = json['job_position'];
    phone = json['phone'];
    email = json['email'];
    dob = json['dob'];
    ssn = json['ssn'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_name'] = this.employeeName;
    data['job_position'] = this.jobPosition;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['ssn'] = this.ssn;
    data['location'] = this.location;

    return data;
  }
}

class ProfileApi extends StatefulWidget {
  @override
  _ProfileApiState createState() => _ProfileApiState();
}

class _ProfileApiState extends State<ProfileApi> {
  Future<Profile> futureData;
  @override
  void initState() {
    super.initState();
    futureData = fetchprofile();
    print('aaaaaaaaaaaaaaaaaa$futureData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('fffffffffffffffff'),
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.black,
                  size: 40,
                ),
                onPressed: () {
                  fetchprofile();
                },
              ),
            ),
            FutureBuilder<Profile>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
           
                  return Column(
                    children: [
                      //
                      Text(snapshot.data.data.employeeName),
                      Text(snapshot.data.data.jobPosition),
                      Text(snapshot.data.data.phone),
                      Text(snapshot.data.data.dob),
                      Text(snapshot.data.data.ssn),
                      Text(snapshot.data.data.location),
                      Text(snapshot.data.data.email) == null
                          ? new Container(
                              child: Text('------${snapshot.data.data.email}'),
                            )
                          : new Container(child: Text('.........')),
                      //   Text(snapshot.data.userId.toString()),
                      //   Text(snapshot.data.id.toString()),
                      //   Text(snapshot.data.title),
                      //     Text(snapshot.data.completed.toString()),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  print('jjjjjjjjj');
                  return CircularProgressIndicator();
                }

                // By default, show a loading spinner.
              },
            ),
          ],
        ),
      ),
    );
  }
}
