import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///import 'package:TheStafferEmployee/bloc/login_bloc/login_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

import '../../repositories/repositories.dart';

Future<Profile> fetchprofile() async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String? token = await storage.read(key: 'token');
  //final url = 'https://dev5.thestaffer.com/v1/admin/get-profile-data';
   UserRepository request = UserRepository();
 
  final url =request.mainUrl +'/v1/admin/get-profile-data';
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

    return Profile.fromJson(jsonDecode(response.body));
  } else {
    // Throw an exception or return a default Profile in case of an error
    throw Exception('Failed to fetch profile: ${response.statusCode}');

  } 
}
class Profile {
 late Data data;

  Profile({required this.data});

  Profile.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
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
  late String employeeName;
  late String jobPosition;
 late String profilePic;
 late String phone;
 late String email;
 late String dob;
 late String ssn;
 late String location;

  Data(
      {required this.employeeName,
      required this.jobPosition,
     required this.profilePic,
     required this.phone,
     required this.email,
     required this.dob,
     required this.ssn,
     required this.location});

  Data.fromJson(Map<String, dynamic> json) {
    employeeName = json['employee_name'];
    jobPosition = json['job_position'];
    profilePic = json['profile_pic'];
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
    data['profile_pic'] = this.profilePic;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['ssn'] = this.ssn;
    data['location'] = this.location;
    return data;
  }
}
/*
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
*/