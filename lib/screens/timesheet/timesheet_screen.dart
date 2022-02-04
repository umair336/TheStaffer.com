// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:TheStafferEmployee/screens/home/homeapi.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './addtimesheet.dart';
//import 'timesheetApi.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

///
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as s;

Future<TimeSheetData> timesheet() async {
  final s.FlutterSecureStorage storage = new s.FlutterSecureStorage();
  final String token = await storage.read(key: 'token');
  final a = 2022 / 1 / 1;
  final b = 2022 / 1 / 31;

  const url =
      'https://dev2.thestaffer.com/api/admin/employees/timesheet/list?start_date=${2022 / 1 / 10}&end_date=b';
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

    //print('vvvvvvvvvvvvvvvvvvv${jsonDecode(response.body)}');

    return TimeSheetData.fromJson(jsonDecode(response.body));
  } else {
    print('vvvvvvvvvvvvvvvvvvv');
  }
}

class TimeSheetData {
  List<Timesheet> timesheet;

  TimeSheetData({this.timesheet});

  TimeSheetData.fromJson(Map<String, dynamic> json) {
    if (json['timesheet'] != null) {
      timesheet = <Timesheet>[];
      json['timesheet'].forEach((v) {
        timesheet.add(new Timesheet.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timesheet != null) {
      data['timesheet'] = this.timesheet.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timesheet {
  int id;
  int parentId;
  int employeeJobId;
  int customerId;
  int departmentId;
  int employeeId;
  String hoursForWeek;
  String createdAt;
  String updatedAt;
  Null invoiceId;
  int payrollStatus;
  Null ckDate;
  String overtimeHours;
  String regularHours;
  String timesheetType;
  String customerName;

  Timesheet(
      {this.id,
      this.parentId,
      this.employeeJobId,
      this.customerId,
      this.departmentId,
      this.employeeId,
      this.hoursForWeek,
      this.createdAt,
      this.updatedAt,
      this.invoiceId,
      this.payrollStatus,
      this.ckDate,
      this.overtimeHours,
      this.regularHours,
      this.timesheetType,
      this.customerName});

  Timesheet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    employeeJobId = json['employee_job_id'];
    customerId = json['customer_id'];
    departmentId = json['department_id'];
    employeeId = json['employee_id'];
    hoursForWeek = json['hours_for_week'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    invoiceId = json['invoice_id'];
    payrollStatus = json['payroll_status'];
    ckDate = json['ck_date'];
    overtimeHours = json['overtime_hours'];
    regularHours = json['regular_hours'];
    timesheetType = json['timesheet_type'];
    customerName = json['customer_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['employee_job_id'] = this.employeeJobId;
    data['customer_id'] = this.customerId;
    data['department_id'] = this.departmentId;
    data['employee_id'] = this.employeeId;
    data['hours_for_week'] = this.hoursForWeek;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['invoice_id'] = this.invoiceId;
    data['payroll_status'] = this.payrollStatus;
    data['ck_date'] = this.ckDate;
    data['overtime_hours'] = this.overtimeHours;
    data['regular_hours'] = this.regularHours;
    data['timesheet_type'] = this.timesheetType;
    data['customer_name'] = this.customerName;
    return data;
  }
}

class TimesheetScreen extends StatefulWidget {
  @override
  _TimesheetScreenState createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
  Future<TimeSheetData> futureData;
  bool isExpanded = false;
  String start = "";
  String end = "";
  String startDate = DateFormat('EEE d MMM, y').format(DateTime.now());
  String endDate = DateFormat('EEE d MMM, y').format(DateTime.now());
  // String weekstrart = "";
  // String weekend = "";
  var rugular = "";
  var over = "";
  var total = "";
  var week_end_date;
  var week_start_date;
  var sssssdate;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    loadData(startDate, endDate);

    futureData = timesheet();
  }

  void loadData(start, end) {
    print('------date-----');
    print(start);
    print(end);

    final String _url = '/admin/reports/employee-timesheet/list';
    final Object _data = {
      "customer": "",
      "start_date": "Aug 22, 2021",
      "end_date": "Sep 04, 2021",
      //"start_date": start,
      //"end_date": end,
      "vendors": "",
      "week_ends": "",
      "branch": "",
      "date_format": "M",
    };
    BlocProvider.of<AuthenticationBloc>(context).add(
      FetchTimeSheetEvent(url: _url, data: _data),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is TimesheetLoadedState) {
          return new Scaffold(
              body: SingleChildScrollView(
                  child: FutureBuilder<TimeSheetData>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              /* Text(
                        "employee_job_id   ==  ${snapshot.data.data.records[0].employeeJobId}"),
                    Text(
                        "employee_id   ==  ${snapshot.data.data.records[0].employeeId}"),
                    Text(
                        "customer_id   ==  ${snapshot.data.data.records[0].customerId}"),
                    Text(
                        "billing_rate   ==  ${snapshot.data.data.records[0].billingRate}"),
                    Text(
                        "overtime_billing_rate   ==  ${snapshot.data.data.records[0].overtimeBillingRate}"),
                    Text(
                        "Pay Rate   ==  ${snapshot.data.data.records[0].payRate}"),
                    Text(
                        "over_time pay rate   ==  ${snapshot.data.data.records[0]..overtimePayRate}"),
                    Text(
                        "emplyee name ==  ${snapshot.data.data.records[0].empName}"),
                    Text(
                        "Job number   ==  ${snapshot.data.data.records[0].jobNumber}"),
                    Text(
                        "Job Position   ==  ${snapshot.data.data.records[0].jobPosition}"),
                    Text(
                        "timesheet table id   ==  ${snapshot.data.data.records[0].timesheetTableId}"),
                    Text(
                        "-----------------------------------time_sheet_weekly----------------------"),
                    Text(
                        "id  == ${snapshot.data.data.records[0].timeSheetWeekly.id}"),
                    Text(
                        "parent id  == ${snapshot.data.data.records[0].timeSheetWeekly.parentId}"),
                    Text(
                        "employ job id  == ${snapshot.data.data.records[0].timeSheetWeekly.employeeJobId}"),
                    Text(
                        "customer id  == ${snapshot.data.data.records[0].timeSheetWeekly.customerId}"),
                    Text(
                        "department id  == ${snapshot.data.data.records[0].timeSheetWeekly.departmentId}"),
                    Text(
                        "employee id  == ${snapshot.data.data.records[0].timeSheetWeekly.employeeId}"),
                    Text(
                        "hours for week  == ${snapshot.data.data.records[0].timeSheetWeekly.hoursForWeek}"),
                    Text(
                        "created at  == ${snapshot.data.data.records[0].timeSheetWeekly.createdAt}"),
                    Text(
                        "updated  at  == ${snapshot.data.data.records[0].timeSheetWeekly.updatedAt}"),
                    Text(
                        "payroll  status  == ${snapshot.data.data.records[0].timeSheetWeekly.payrollStatus}"),
                    Text(
                        "week  type  == ${snapshot.data.data.records[0].timeSheetWeekly.timesheetType}"),*/

                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          stops: [
                                            0.1,
                                            0.5,
                                          ],
                                          colors: [
                                            Color.fromRGBO(0, 91, 196, 1),
                                            Color.fromRGBO(97, 29, 165, 1),
                                          ],
                                        )),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Time Sheet',
                                                      style: TextStyle(
                                                        fontSize: 18.0,
                                                        color: Color.fromRGBO(
                                                            255, 255, 255, 1),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Nunito Sans',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.add_circle,
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          size: 20,
                                                        ),
                                                        onPressed: () {
                                                          ///    weekDifference(weekstrart);
                                                        },
                                                      ),
                                                      Image.asset(
                                                        "images/Group 12126@2x.png",
                                                        height:
                                                            size.height * 0.03,
                                                        // fit: BoxFit.cover,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                //   height: MediaQuery.of(context).size.height * 0.04,
                                                decoration: new BoxDecoration(
                                                  color: Colors.purple.shade700,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: TextButton(
                                                      onPressed: () {
                                                        _selectStart(context);
                                                      },
                                                      child: Text(
                                                        startDate,
                                                        style: TextStyle(
                                                          //  fontWeight: FontWeight.bold,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03),
                                              Container(
                                                child: Text(
                                                  'to',
                                                  style: TextStyle(
                                                    //  fontWeight: FontWeight.bold,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Nunito Sans',
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03),
                                              Container(
                                                height: 40,
                                                decoration: new BoxDecoration(
                                                  color: Colors.purple.shade700,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                  child: TextButton(
                                                      onPressed: () {
                                                        _selectEnd(context);
                                                      },
                                                      child: Text(
                                                        endDate,
                                                        style: TextStyle(
                                                          //  fontWeight: FontWeight.bold,
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        Container(
                                          child: Text(
                                            'Overall Totals',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 1),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        'Regular',
                                                        style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          //     fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '41:57',
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        'Over',
                                                        style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          //    fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '02:52',
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .baseline,
                                                  textBaseline:
                                                      TextBaseline.alphabetic,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        'Total',
                                                        style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          // fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        '41:49',
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              /*  Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Container(
                                    child: Text(
                                      'Absence',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontFamily: 'Nunito Sans',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        //      fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '3:00',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'Nunito Sans',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )*/
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                      ],
                                    ),
                                  ),
                                  ListView(
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    children: <Widget>[
                                      new SizedBox(height: 0.0),
                                      new Container(
                                        child: new ListView.builder(
                                          shrinkWrap: true,
                                          //       itemCount: state.timesheets.length,
                                          itemCount:
                                              snapshot.data.timesheet.length,
                                          physics: ScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            week_end_date = snapshot.data
                                                .timesheet[index].hoursForWeek;
                                            week_start_date =
                                                DateTime.parse(week_end_date)
                                                    .subtract(
                                                        new Duration(days: 7));
                                            //
                                            rugular = snapshot.data
                                                .timesheet[index].regularHours;
                                            over = snapshot.data
                                                .timesheet[index].overtimeHours;
                                            Container(
                                              child: TotalHoursCalculate(),
                                            );
                                            return new Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 0, 25, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    //color: Colors.black12,

                                                    child: Column(
                                                      children: <Widget>[
                                                        ExpansionTile(
                                                          trailing:
                                                              /* isExpanded //assets/collapse_arrow.png
                                                ? Image.asset(
                                                    "images/Path 54463.png",
                                                  )
                                                : Image.asset(
                                                    'images/Path 54470.png'),
                                        onExpansionChanged: (bool expanding) =>
                                            setState(
                                                () => isExpanded = expanding),

*/
                                                              Image.asset(
                                                            "images/Path 54463@2x.png",
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                            // fit: BoxFit.cover,
                                                          ),
                                                          title: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        'Weekly Summary',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              14.0,
                                                                          color: Color.fromRGBO(
                                                                              13,
                                                                              91,
                                                                              196,
                                                                              1),
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        14,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      week_start_date
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: Color.fromRGBO(
                                                                            31,
                                                                            33,
                                                                            38,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '  to  ',
                                                                      style:
                                                                          TextStyle(
                                                                        //  fontWeight: FontWeight.bold,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: Color.fromRGBO(
                                                                            112,
                                                                            112,
                                                                            112,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      /* weekstrart = snapshot
                                                                          .data
                                                                          .timesheet[
                                                                              index]
                                                                          .hoursForWeek,
                                                                        */
                                                                      snapshot
                                                                          .data
                                                                          .timesheet[
                                                                              index]
                                                                          .hoursForWeek,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontFamily:
                                                                            'Nunito Sans',
                                                                        color: Color.fromRGBO(
                                                                            31,
                                                                            33,
                                                                            38,
                                                                            1),
                                                                      ),
                                                                    ),
                                                                    //          Container(
                                                                    //  child: weekDifference(weekstrart),
                                                                    //),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        25,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade200,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  // color: Color.fromRGBO(0, 0, 0, 0.16),
                                                                  child:
                                                                      Container(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.baseline,
                                                                            textBaseline:
                                                                                TextBaseline.alphabetic,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  'Regular',
                                                                                  style: TextStyle(
                                                                                    fontSize: 10.0,
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Color.fromRGBO(112, 112, 112, 1),
                                                                                    //  fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  rugular = snapshot.data.timesheet[index].regularHours,
                                                                                  style: TextStyle(
                                                                                    fontSize: 12.0,
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.baseline,
                                                                            textBaseline:
                                                                                TextBaseline.alphabetic,
                                                                            children: [
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                              Container(
                                                                                child: Text(
                                                                                  'Over',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 10.0,
                                                                                    color: Color.fromRGBO(112, 112, 112, 1),
                                                                                    // fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  over = snapshot.data.timesheet[index].overtimeHours,
                                                                                  style: TextStyle(
                                                                                    fontSize: 12.0,
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.baseline,
                                                                            textBaseline:
                                                                                TextBaseline.alphabetic,
                                                                            children: [
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                              Container(
                                                                                child: Text(
                                                                                  'Total',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 10.0,
                                                                                    color: Color.fromRGBO(112, 112, 112, 1),
                                                                                    //   fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  '41:49.......',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 12.0,
                                                                                    color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        /*   Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .baseline,
                                                          textBaseline:
                                                              TextBaseline
                                                                  .alphabetic,
                                                          children: [
                                                            SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.01),
                                                            Container(
                                                              child: Text(
                                                                'Absence',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      10.0,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1),
                                                                  //  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                '3:00',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          31,
                                                                          33,
                                                                          38,
                                                                          1),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.01),
                                                          ],
                                                        ),
                                                      ),
                                                      */
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          ),
                                                          children: <Widget>[
                                                            /*
                                          ListTile(
                                            title: Column(
                                              children: [
                                                ListView.builder(
                                                  physics: ScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount: 5,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    '.',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          30.0,
                                                                      color: Color.fromRGBO(
                                                                          183,
                                                                          14,
                                                                          105,
                                                                          1),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: 70,
                                                                  width: 2,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200,
                                                                ),
                                                              ],
                                                            )),
                                                        Container(
                                                          child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      /*
                                                Padding(
                                                    padding: const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
                                                    child: Container(
                                                        height: 30,
                                                        width: 2,
                                                        color: Colors.red),
                                                  ),
                                                      */
                                                                      /*
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.baseline,
                                                      textBaseline: TextBaseline.alphabetic,
                                                      children: [
                                                        
                                                        Text(
                                                          '.',
                                                          style: TextStyle(
                                                            fontSize: 40.0,
                                                            color: Color.fromRGBO(
                                                                183, 14, 105, 1),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 27,
                                                        ),
                                                      
                                                      ],
                                                    ),
                                                  ),*/

                                                                      Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            10,
                                                                            17,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'JUN 01,2021  ',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                14.0,
                                                                            color: Color.fromRGBO(
                                                                                13,
                                                                                91,
                                                                                196,
                                                                                1),
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            105,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets.fromLTRB(
                                                                            0,
                                                                            17,
                                                                            0,
                                                                            0),
                                                                        child: Image
                                                                            .asset(
                                                                          "images/Union 10@2x.png",
                                                                          height:
                                                                              size.height * 0.02,
                                                                          // fit: BoxFit.cover,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade200,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),

                                                                    // color: Color.fromRGBO(0, 0, 0, 0.16),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        SizedBox(
                                                                          width:
                                                                              27,
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.baseline,
                                                                            textBaseline:
                                                                                TextBaseline.alphabetic,
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  'Regular',
                                                                                  style: TextStyle(
                                                                                    fontSize: 10.0,
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Color.fromRGBO(112, 112, 112, 1),
                                                                                    //  fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  '41:57',
                                                                                  style: TextStyle(
                                                                                    fontSize: 12.0,
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 15,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              30,
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.baseline,
                                                                            textBaseline:
                                                                                TextBaseline.alphabetic,
                                                                            children: [
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                              Container(
                                                                                child: Text(
                                                                                  'Over',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 10.0,
                                                                                    color: Color.fromRGBO(112, 112, 112, 1),
                                                                                    // fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  '02:52',
                                                                                  style: TextStyle(
                                                                                    fontSize: 12.0,
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              30,
                                                                        ),
                                                                        Container(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.baseline,
                                                                            textBaseline:
                                                                                TextBaseline.alphabetic,
                                                                            children: [
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                              Container(
                                                                                child: Text(
                                                                                  'Total',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 10.0,
                                                                                    color: Color.fromRGBO(112, 112, 112, 1),
                                                                                    //   fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: Text(
                                                                                  '41:49',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 12.0,
                                                                                    color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              27,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                              ]),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          */
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 20.0),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        } else {
                          print('jjjjjjjjj');
                          return CircularProgressIndicator();
                        }
                      })));
        } else {
          return Scaffold(
            //loader
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Style.Colors.mainColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }

  _selectStart(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
              primaryColor: const Color.fromRGBO(13, 91, 196, 1),
              accentColor: const Color.fromRGBO(13, 91, 196, 1),
              colorScheme: ColorScheme.light(
                primary: const Color.fromRGBO(13, 91, 196, 1),
              )),
          child: child,
        );
      },
    );
    if (selected != null)
      setState(() {
        startDate = DateFormat('EEE d MMM, y').format(selected);
      });
  }

  _selectEnd(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color.fromRGBO(13, 91, 196, 1),
            accentColor: const Color.fromRGBO(13, 91, 196, 1),
            colorScheme: ColorScheme.light(
              primary: const Color.fromRGBO(13, 91, 196, 1),
            ),
          ),
          child: child,
        );
      },
    );
    if (selected != null)
      setState(() {
        endDate = DateFormat('EEE d MMM, y').format(selected);
        print(endDate);
        // endDate = selected;
        // loadData(startDate, endDate);
      });
  }

  TotalHoursCalculate() {
    print('ccccccccccc$week_start_date');

    //  to

//
  }
}
