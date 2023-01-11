import 'package:TheStafferEmployee/constants/formate.dart';
import 'package:TheStafferEmployee/screens/timesheet/timesheetApi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:TheStafferEmployee/screens/home/homeapi.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../assignment/assignment_screen.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TimesheetScreen extends StatefulWidget {
  @override
  _TimesheetScreenState createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
  /// Future<TimeSheetData> futureData;
  Future<TimeSheetModel> showTimeSheetData;
  Future<FormateApi> futureFormate;
  bool isExpanded = false;
  String start = "";
  String end = "";
  String startDate = DateFormat('MMMM d,yyyy')
      .format(DateTime.now().subtract(new Duration(days: 30)));
  String endDate = DateFormat('MMMM d,yyyy').format(DateTime.now());
  // String weekstrart = "";
  // String weekend = "";
  var rugular = "";
  var over = "";

  var week_end_date;
  var week_start_date;
  int mg = 0;

  // static const duration = 0;
  Duration totalweek;
  Duration month_reg;
  Duration month_over;
  Duration month_toal;
  bool val_month_reg = false;
  bool val_month_over = false;
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    //  _selectedIndex = index;
    print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq$index');
    if (index == 0) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else if (index == 1) {
      /*  setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TimesheetScreen()));
      });*/
    } else if (index == 2) {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssignmentScreen(),
            ));
      });
    } else if (index == 3) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      });
    }
  }

  @override
  void initState() {
    super.initState();

    initializeDateFormatting();

    showTimeSheetData = timesheet(startDate, endDate);
    futureFormate = fetchformate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // futureData = timesheet(startDate, endDate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return new Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.white),
              BottomNavigationBarItem(
                  icon: Icon(Icons.lock_clock),
                  label: 'Time Sheet',
                  backgroundColor: Style.Colors.mainColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Assignment',
                  backgroundColor: Style.Colors.mainColor),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  backgroundColor: Style.Colors.mainColor),
            ],
            type: BottomNavigationBarType.fixed,
            // backgroundColor: Style.Colors.mainColor,
            // iconSize: 30,
            // selectedFontSize: 10,
            // unselectedFontSize: 8,
            unselectedItemColor: Color.fromRGBO(83, 83, 83, 1),
            selectedItemColor: Color.fromRGBO(183, 14, 105, 1),
            //   type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            //   selectedItemColor: Colors.black,
            iconSize: 25,
            onTap: _onItemTapped,
            elevation: 4),
        body: RefreshIndicator(
          //   displacement: 250,
          backgroundColor: Colors.white,
          color: Color.fromRGBO(13, 91, 196, 1),
          //  strokeWidth: 2,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () {
            Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    pageBuilder: (a, b, c) => TimesheetScreen(),
                    transitionDuration: Duration(seconds: 0)));
            return Future.value(false);
          },
          child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: FutureBuilder<TimeSheetModel>(
                  future: showTimeSheetData,
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        break;
                      case ConnectionState.waiting:
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Style.Colors.mainColor),
                                  strokeWidth: 4.0,
                                ),
                              )
                            ],
                          ),
                        );
                      case ConnectionState.active:
                        break;
                      case ConnectionState.done:
                        if (snapshot.data.timesheet.isNotEmpty)
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
                                                0.05),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 12,
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
                                                      /* IconButton(
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      size: 20,
                                                    ),
                                                    onPressed: () {
                                                      ///    weekDifference(weekstrart);
                                                    },
                                                  ),*/
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
                                                0.029),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(39, 0, 39, 0),
                                          child: Container(
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    //   height: MediaQuery.of(context).size.height * 0.04,
                                                    decoration:
                                                        new BoxDecoration(
                                                      color: Colors
                                                          .purple.shade700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: TextButton(
                                                          onPressed: () {
                                                            _selectStart(
                                                                context);
                                                          },
                                                          child: AutoSizeText(
                                                            startDate,
                                                            style: TextStyle(
                                                              //  fontWeight: FontWeight.bold,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      1),
                                                            ),
                                                            maxFontSize: 16,
                                                            minFontSize: 8,
                                                            maxLines: 1,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  child: Text(
                                                    'to',
                                                    style: TextStyle(
                                                      //  fontWeight: FontWeight.bold,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration:
                                                        new BoxDecoration(
                                                      color: Colors
                                                          .purple.shade700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                      child: TextButton(
                                                          onPressed: () {
                                                            _selectEnd(context);
                                                          },
                                                          child: AutoSizeText(
                                                            endDate,
                                                            style: TextStyle(
                                                              //  fontWeight: FontWeight.bold,
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      255,
                                                                      255,
                                                                      255,
                                                                      1),
                                                            ),
                                                            maxFontSize: 16,
                                                            minFontSize: 8,
                                                            maxLines: 1,
                                                          )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        /* Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Job position',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Nunito Sans',
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          snapshot.data.timesheet.record[0]
                                              .jobPosition
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Nunito Sans',
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                            //     fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),*/
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
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
                                                0.02),
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
                                                    for (int i = 0;
                                                        i <
                                                            snapshot
                                                                .data
                                                                .timesheet
                                                                .length;
                                                        i++)
                                                      Container(
                                                        child:
                                                            Regulartotalfunction(
                                                                snapshot
                                                                    .data
                                                                    .timesheet[
                                                                        i]
                                                                    .regularHours
                                                                    .toString()),
                                                      ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          month_reg.inHours
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '.',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          month_reg.inMinutes
                                                                      .remainder(
                                                                          60)
                                                                      .toString() ==
                                                                  '0'
                                                              ? '00'
                                                              : month_reg
                                                                  .inMinutes
                                                                  .remainder(60)
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
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
                                                        'Overtime',
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
                                                    for (int i = 0;
                                                        i <
                                                            snapshot
                                                                .data
                                                                .timesheet
                                                                .length;
                                                        i++)
                                                      Container(
                                                        child: Overtotalfunction(
                                                            snapshot
                                                                .data
                                                                .timesheet[i]
                                                                .overtimeHours
                                                                .toString()),
                                                      ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          month_over.inHours
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '.',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          month_over.inMinutes
                                                                      .remainder(
                                                                          60)
                                                                      .toString() ==
                                                                  '0'
                                                              ? '00'
                                                              : month_over
                                                                  .inMinutes
                                                                  .remainder(60)
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
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
                                                      child: Monthtotalfuction(
                                                          month_reg,
                                                          month_over),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          month_toal.inHours
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '.',
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          month_toal.inMinutes
                                                                      .remainder(
                                                                          60)
                                                                      .toString() ==
                                                                  '0'
                                                              ? '00'
                                                              : month_toal
                                                                  .inMinutes
                                                                  .remainder(60)
                                                                  .toString(),
                                                          style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ],
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
                                                .timesheet[index].hoursForWeek
                                                .toString();
                                            week_start_date =
                                                DateTime.parse(week_end_date)
                                                    .subtract(
                                                        new Duration(days: 7));
                                            //
                                            //  rugular = snapshot.data    .timesheet[index].regularHours;
                                            //    over = snapshot.data  .timesheet[index].overtimeHours;
                                            // Container(child: DateCalculte());
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
                                                          trailing: SizedBox(),
                                                          /*Image.asset(
                                                        "images/Path 54463@2x.png",
                                                        height:
                                                            size.height * 0.02,
                                                        // fit: BoxFit.cover,
                                                      ),*/
                                                          title: Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data
                                                                            .timesheet[index]
                                                                            .jobPosition
                                                                            .toString(),
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
                                                              Container(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  snapshot
                                                                      .data
                                                                      .timesheet[
                                                                          index]
                                                                      .customerName
                                                                      .toString(),
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
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: Container(
                                                                          child: FutureBuilder<
                                                                                  FormateApi>(
                                                                              future:
                                                                                  futureFormate,
                                                                              builder:
                                                                                  (context, snapshoot) {
                                                                                if (snapshoot.hasData) {
                                                                                  return Text(
                                                                                    //  DateTime.parse(snapshot.data.timesheet[index].hoursForWeek.toString()).subtract(new Duration(days: 7)).toString(),
                                                                                    snapshot.data.timesheet[index].hoursForWeek.toString() != null ? DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot.data.timesheet[index].hoursForWeek.toString()).subtract(new Duration(days: 7))) : ' ',
                                                                                    style: TextStyle(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 16.0,
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Container();
                                                                                }
                                                                              })),
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
                                                                    Expanded(
                                                                      child: Container(
                                                                          child: FutureBuilder<
                                                                                  FormateApi>(
                                                                              future:
                                                                                  futureFormate,
                                                                              builder:
                                                                                  (context, snapshoot) {
                                                                                if (snapshoot.hasData) {
                                                                                  return Text(
                                                                                    snapshot.data.timesheet[index].hoursForWeek != null ? DateFormat(snapshoot.data.data[0].currentDateFormat).format(DateTime.parse(snapshot.data.timesheet[index].hoursForWeek)) : ' ',
                                                                                    style: TextStyle(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontSize: 16.0,
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      color: Color.fromRGBO(31, 33, 38, 1),
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return Container();
                                                                                }
                                                                              })),
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
                                                                        27,
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
                                                                              Text(
                                                                                rugular = snapshot.data.timesheet[index].regularHours.toString(),
                                                                                style: TextStyle(
                                                                                  fontSize: 12.0,
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: Color.fromRGBO(31, 33, 38, 1),
                                                                                  fontWeight: FontWeight.bold,
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
                                                                                  'Overtime',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Nunito Sans',
                                                                                    fontSize: 10.0,
                                                                                    color: Color.fromRGBO(112, 112, 112, 1),
                                                                                    // fontWeight: FontWeight.bold,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                over = snapshot.data.timesheet[index].overtimeHours.toString(),
                                                                                style: TextStyle(
                                                                                  fontSize: 12.0,
                                                                                  fontFamily: 'Nunito Sans',
                                                                                  color: Color.fromRGBO(31, 33, 38, 1),
                                                                                  fontWeight: FontWeight.bold,
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
                                                                              Container(
                                                                                child: Weektotal(),
                                                                              ),
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
                                                                              Row(
                                                                                children: [
                                                                                  Text(
                                                                                    totalweek.inHours.toString(),
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 12.0,
                                                                                      color: Color.fromRGBO(31, 33, 38, 1),
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    '.',
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 12.0,
                                                                                      color: Color.fromRGBO(31, 33, 38, 1),
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    totalweek.inMinutes.remainder(60).toString() == '0' ? '00' : totalweek.inMinutes.remainder(60).toString(),
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Nunito Sans',
                                                                                      fontSize: 12.0,
                                                                                      color: Color.fromRGBO(31, 33, 38, 1),
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                  ),
                                                                                ],
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
                              ),
                              Container(
                                child: dispos(),
                              )
                            ],
                          );
                        else {
                          return Column(children: [
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  'Time Sheet',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Nunito Sans',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Row(
                                                children: [
                                                  /* IconButton(
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      size: 20,
                                                    ),
                                                    onPressed: () {
                                                      ///    weekDifference(weekstrart);
                                                    },
                                                  ),*/
                                                  Image.asset(
                                                    "images/Group 12126@2x.png",
                                                    height: size.height * 0.03,
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.029),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(39, 0, 39, 0),
                                      child: Container(
                                        height: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Container(
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
                                                      child: AutoSizeText(
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
                                                        maxFontSize: 15,
                                                        minFontSize: 8,
                                                        maxLines: 1,
                                                      )),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
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
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Container(
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
                                                      child: AutoSizeText(
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
                                                        maxFontSize: 16,
                                                        minFontSize: 8,
                                                        maxLines: 1,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    /* Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Job position',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Nunito Sans',
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          snapshot.data.timesheet.record[0]
                                              .jobPosition
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Nunito Sans',
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                            //     fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),*/
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Container(
                                      child: Text(
                                        'Overall Totals',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito Sans',
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Regular',
                                                    style: TextStyle(
                                                      fontSize: 10.0,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      //     fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '00',
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
                                                    Text(
                                                      '.',
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
                                                    Text(
                                                      '00',
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Overtime',
                                                    style: TextStyle(
                                                      fontSize: 10.0,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      //    fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '00',
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
                                                    Text(
                                                      '.',
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
                                                    Text(
                                                      '00',
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Total',
                                                    style: TextStyle(
                                                      fontSize: 10.0,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '00',
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
                                                    Text(
                                                      '.',
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
                                                    Text(
                                                      '00',
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
                                                  ],
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Text(
                                'No Time Sheet',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito Sans',
                                    color: Color.fromRGBO(112, 112, 112, 1)),
                              ),
                            )
                          ]);
                        }
                    }
                  })),
        ));
  }

  _selectStart(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: new DateFormat('MMMM d,yyyy').parse(startDate),
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
        startDate = DateFormat('MMMM d,yyyy').format(selected);
        print('rrrrrrrrrrrrrrrrrrrr');

        timesheet(startDate, endDate);
        var fre = timesheet(startDate, endDate);
        setState(() {
          showTimeSheetData = fre;
        });
      });
  }

  _selectEnd(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: new DateFormat('MMMM d,yyyy').parse(endDate),
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
        endDate = DateFormat('MMMM d,yyyy').format(selected);
        print(endDate);

        var fre = timesheet(startDate, endDate);
        setState(() {
          showTimeSheetData = fre;
        });
        // timesheet(startDate, endDate);

        // endDate = selected;
        // loadData(startDate, endDate);
      });
  }

  /* DateCalculte() {
    // print('ccccccccccc$week_start_date');
    week_start_date = DateFormat("yyyy/M/d").format(week_start_date);
    print('ddddddddddddddddddddddddddddddd$week_start_date');
  }*/

  Weektotal() {
    print('ccccccccccc$rugular cccccccccccccc$over');

    var regular_week = rugular.split('.');
    var over_week = over.split('.');
    // print(regular_week[0]);
    // print(regular_week[1]);
    //  print(over_week[0]);
    // print(over_week[1]);

    Duration reg_week = new Duration(
      hours: int.parse(regular_week[0]),
      minutes: int.parse(regular_week[1]),
    );
    //print('ssssssssss$reg_week');
    Duration ove_week = new Duration(
      hours: int.parse(over_week[0]),
      minutes: int.parse(over_week[1]),
    );
    //  print(ove_week);

    Duration total_reg_over = new Duration(
        hours: int.parse(regular_week[0]) + int.parse(over_week[0]),
        minutes: int.parse(regular_week[1]) + int.parse(over_week[1]));

    print(total_reg_over);

    totalweek = total_reg_over;
    //String duration = DateFormat('hh:mm').format(totalweek);

    print(
        'iiiiiiiiiiiiiiiiiiiiiiiiiiiiii${total_reg_over.inMinutes} dddddddddddddddddddddddddd${totalweek}');
  }

  Regulartotalfunction(reg) {
    print('pppppp $reg');
    var m_reg = reg.split('.');
    print('object${m_reg[0]}jjjjjjjj${m_reg[1]}');

    if (val_month_reg == false) {
      month_reg = new Duration(
          hours: int.parse(m_reg[0]), minutes: int.parse(m_reg[1]), seconds: 0);
      val_month_reg = true;
    } else {
      month_reg = new Duration(
          hours: int.parse(m_reg[0]),
          minutes:
              int.parse(m_reg[1]) + int.parse(month_reg.inMinutes.toString()),
          seconds: 0);
    }
    print('dddddddddddddddddddddd$month_reg');
  }

  Overtotalfunction(ov) {
    print('iiiiiiiiiiiiiiiiiiiiiiiiii $ov');
    var m_reg = ov.split('.');
    print('object${m_reg[0]}nnnnnnnn${m_reg[1]}');
    if (val_month_over == false) {
      month_over = new Duration(
          hours: int.parse(m_reg[0]), minutes: int.parse(m_reg[1]), seconds: 0);
      val_month_over = true;
      print('hhhhhhhhhhhhhhhhhhhhhh$month_over');
    } else {
      month_over = new Duration(
          hours: int.parse(m_reg[0]),
          minutes:
              int.parse(m_reg[1]) + int.parse(month_over.inMinutes.toString()),
          seconds: 0);
      print('hhhhhhhhhhhhhhhhhhhhhh$month_over');
    }
  }

  Monthtotalfuction(Duration d1, Duration d2) {
    print('yyyyyyyyyyyyyyyyyyyyyy$d1 yyyyyyyyyyyyyyyyyyyyyy$d2');

    month_toal = new Duration(
      hours:
          int.parse(d1.inHours.toString()) + int.parse(d2.inHours.toString()),
      minutes: int.parse(d1.inMinutes.remainder(60).toString()) +
          int.parse(d2.inMinutes.remainder(60).toString()),
    );
  }

  dispos() {
    month_reg = new Duration(hours: 0, minutes: 0, seconds: 0);
    month_over = new Duration(hours: 0, minutes: 0, seconds: 0);

    //month_reg= new Duration()
  }
}
