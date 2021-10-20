// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staffer/bloc/auth_bloc/auth.dart';
import 'package:staffer/style/theme.dart' as Style;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import './addtimesheet.dart';

class TimesheetScreen extends StatefulWidget {
  @override
  _TimesheetScreenState createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
  bool isExpanded = false;
  String start = "";
  String end = "";
  String startDate = DateFormat('EEE d MMM, y').format(DateTime.now());
  String endDate = DateFormat('EEE d MMM, y').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    loadData(startDate, endDate);
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
                child: Column(
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
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Addtimesheet()));
                                      },
                                    ),
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
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              //   height: MediaQuery.of(context).size.height * 0.04,
                              decoration: new BoxDecoration(
                                color: Colors.purple.shade700,
                                borderRadius: BorderRadius.circular(20),
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
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito Sans',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
                            Container(
                              child: Text(
                                'to',
                                style: TextStyle(
                                  //  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Nunito Sans',
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.03),
                            Container(
                              height: 40,
                              decoration: new BoxDecoration(
                                color: Colors.purple.shade700,
                                borderRadius: BorderRadius.circular(20),
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
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito Sans',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Text(
                          'Overall Totals',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito Sans',
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Container(
                                    child: Text(
                                      'Regular',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontFamily: 'Nunito Sans',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        //     fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '41:57',
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
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Container(
                                    child: Text(
                                      'Over',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontFamily: 'Nunito Sans',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        //    fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '02:52',
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
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Container(
                                    child: Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontFamily: 'Nunito Sans',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '41:49',
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
                            ),
                            Container(
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
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
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
                        itemCount: 4,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return new Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
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
                                          height: size.height * 0.02,
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
                                                    child: Text(
                                                      'Weekly Summary',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Color.fromRGBO(
                                                            13, 91, 196, 1),
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
                                                  const EdgeInsets.fromLTRB(
                                                      14, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'JUN 01,221',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          31, 33, 38, 1),
                                                    ),
                                                  ),
                                                  Text(
                                                    '  to  ',
                                                    style: TextStyle(
                                                      //  fontWeight: FontWeight.bold,
                                                      fontSize: 16.0,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          112, 112, 112, 1),
                                                    ),
                                                  ),
                                                  Text(
                                                    'JUN 07,2021',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16.0,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          31, 33, 38, 1),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      25, 0, 0, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade200,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                // color: Color.fromRGBO(0, 0, 0, 0.16),
                                                child: Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .baseline,
                                                          textBaseline:
                                                              TextBaseline
                                                                  .alphabetic,
                                                          children: [
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                'Regular',
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
                                                                '41:57',
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
                                                              height: 15,
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
                                                                'Over',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      10.0,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1),
                                                                  // fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                '02:52',
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
                                                      Container(
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
                                                                'Total',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      10.0,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1),
                                                                  //   fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Text(
                                                                '41:49',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      12.0,
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
                                                      Container(
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
            )),
          );
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
}
