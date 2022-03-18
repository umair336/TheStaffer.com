import 'package:TheStafferEmployee/constants/formate.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import './homeapi.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Future<Home> futureData;
  Future<FormateApi> futureFormate;
  // String startDate = DateFormat('yyyy/M/d').format(DateTime.now().subtract(new Duration(days: 7)));

  // String endDate = DateTime.now().parse().subtract(new Duration(days: 7)) as String;

  @override
  void initState() {
    super.initState();
    futureData = fetchhome();
    futureFormate = fetchformate();
  }

  bool hours = true;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return new Scaffold(
      backgroundColor: const Color(0xfffafafa),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: FutureBuilder<Home>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  //
                  //Text(snapshot.data.data[0].empName),
                  //    Text(snapshot.data.data[0].assignments[0].jobId.toString()),
                  /*   Text(snapshot.data.data.jobPosition),
                        Text(snapshot.data.data.phone),
                        Text(snapshot.data.data.dob),
                        Text(snapshot.data.data.ssn),
                        Text(snapshot.data.data.location),
                        Text(snapshot.data.data.email) == null
                            ? new Container(
                                child: Text('------${snapshot.data.data.email}'),
                              )
                            : new Container(child: Text('.........')),*/
                  //   Text(snapshot.data.userId.toString()),
                  //   Text(snapshot.data.id.toString()),
                  //   Text(snapshot.data.title),
                  //     Text(snapshot.data.completed.toString()),
                  Container(
                    child: Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                            height: (MediaQuery.of(context).size.height),
                            width: (MediaQuery.of(context).size.width),
                            color: Colors.grey.shade100),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 190,
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
                          ),
                        ),
                        Positioned(
                            top: 65,
                            left: 25,
                            child: AvatarView(
                              radius: 23,
                              //borderWidth: 8,
                              // borderColor: Colors.yellow,
                              avatarType: AvatarType.CIRCLE,
                              backgroundColor: Colors.red,
                              imagePath: snapshot.data.data[0].profilePic,
                              placeHolder: Image.network(
                                snapshot.data.data[0].profilePic,
                                width: 50,
                                height: 50,
                                //fit: BoxFit.cover,
                              ),
                            )),
                        Positioned(
                          top: 70,
                          left: 80,
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 80,
                          child: Text(
                            snapshot.data.data[0].empName,
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 70,
                            right: 10,
                            child: IconButton(
                                icon: Icon(
                                  EvaIcons.logOutOutline,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(
                                    LoggedOut(),
                                  );
                                })),
                        Positioned(
                          top: 150,
                          left: 20,
                          right: 20,
                          child: Container(
                            height: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromRGBO(79, 171, 247, 1),
                                  width: 2,
                                ),
                              ),
                              child: CarouselSlider(
                                items: [
                                  Padding(
                                    //    padding: const EdgeInsets.all(8.0),
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 2, 13),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.88,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 10, 0),
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              child: Image.asset(
                                                "images/Path 52375@2x.png",
                                                height: size.height * 0.02,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Image.asset(
                                                        "images/002-schedule@2x.png",
                                                        height:
                                                            size.height * 0.05,

                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Total Hourss',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .previousStartDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  'to',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .previousEndDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    children: [
                                                      AutoSizeText(
                                                        snapshot.data.data[0]
                                                            .totalWeeklyHours
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                        ),
                                                        maxFontSize: 23,
                                                        minFontSize: 15,
                                                        maxLines: 1,
                                                      ),
                                                      /*      Text(
                                                        '.50',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                        ),
                                                      ),*/
                                                      SizedBox(
                                                        width: 18,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    //    padding: const EdgeInsets.all(8.0),
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 2, 13),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.88,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 10, 0),
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              child: Image.asset(
                                                "images/Path 54457@2x.png",

                                                height: size.height * 0.02,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Image.asset(
                                                        "images/002-schedule@2x.png",
                                                        height:
                                                            size.height * 0.05,

                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Total Hours',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            /*Text(
                                                              '13 JUN to 19 JUN',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                            ),*/
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .startDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color.fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  'to',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color.fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .endDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color.fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    children: [
                                                      AutoSizeText(
                                                        snapshot.data.data[0]
                                                            .totalWeeklyHours
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                        ),
                                                        maxFontSize: 23,
                                                        minFontSize: 15,
                                                        maxLines: 1,
                                                      ),
                                                      /*   Text(
                                                        '.50',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                        ),
                                                      ),*/
                                                      SizedBox(
                                                        width: 18,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                                //Slider Container properties
                                options: CarouselOptions(
                                  reverse: false,
                                  initialPage: 2,
                                  enlargeCenterPage: true,
                                  viewportFraction: 3.0,
                                  enableInfiniteScroll: false,
                                  //      enableInfiniteScroll: true,
                                  //  aspectRatio: 30 / 9,
                                  //    autoPlay: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 240,
                          left: 20,
                          right: 20,
                          child: Container(
                            height: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromRGBO(79, 171, 247, 1),
                                  width: 2,
                                ),
                              ),
                              child: CarouselSlider(
                                items: [
                                  Padding(
                                    //    padding: const EdgeInsets.all(8.0),
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 2, 13),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.88,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 10, 0),
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              child: Image.asset(
                                                "images/Path 52375@2x.png",
                                                height: size.height * 0.02,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Image.asset(
                                                        "images/Group 12117@2x.png",
                                                        height:
                                                            size.height * 0.05,

                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Earnings',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            /*  Text(
                                                              '20 JUN to 27 JUN',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          31,
                                                                          33,
                                                                          38,
                                                                          1)),
                                                            ),
                                                            */
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .previousStartDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  'to',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .previousEndDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              31,
                                                                              33,
                                                                              38,
                                                                              1)),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    children: [
                                                      FutureBuilder<FormateApi>(
                                                          future: futureFormate,
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return Text(snapshot
                                                                          .data
                                                                          .data[
                                                                              0]
                                                                          .currencyformat
                                                                          .toString()) !=
                                                                      null
                                                                  ? Container(
                                                                      child:
                                                                          AutoSizeText(
                                                                        snapshot
                                                                            .data
                                                                            .data[0]
                                                                            .currencyformat
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              30,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                                        ),
                                                                        maxFontSize:
                                                                            23,
                                                                        minFontSize:
                                                                            15,
                                                                        maxLines:
                                                                            1,
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      child: Text(
                                                                          ' '));
                                                            } else {
                                                              return Text('');
                                                            }
                                                          }),
                                                      Text(
                                                                snapshot
                                                                    .data
                                                                    .data[0]
                                                                    .earnings
                                                                    .toString(),
                                                              ) !=
                                                              null
                                                          ? new Container(
                                                              child:
                                                                  AutoSizeText(
                                                                snapshot
                                                                    .data
                                                                    .data[0]
                                                                    .prevearnings
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 30,

                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  //      color: Color.fromRGBO(255, 255, 255, 1)
                                                                ),
                                                                maxFontSize: 23,
                                                                minFontSize: 15,
                                                                maxLines: 1,
                                                              ),
                                                            )
                                                          : new Container(
                                                              child: Text('0',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                  ))),

                                                      /*   Text(
                                                        '.50',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                        ),
                                                      ),*/
                                                      SizedBox(
                                                        width: 18,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    //    padding: const EdgeInsets.all(8.0),
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 2, 13),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.88,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 10, 0),
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              child: Image.asset(
                                                "images/Path 54457@2x.png",

                                                height: size.height * 0.02,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 15,
                                                      ),
                                                      Image.asset(
                                                        "images/Group 12117@2x.png",
                                                        height:
                                                            size.height * 0.05,

                                                        // fit: BoxFit.cover,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Earnings',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          112,
                                                                          112,
                                                                          112,
                                                                          1)),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .startDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color.fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  'to',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color.fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                                ),
                                                                SizedBox(
                                                                  width: 7,
                                                                ),
                                                                Text(
                                                                  snapshot
                                                                      .data
                                                                      .data[0]
                                                                      .endDate
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Nunito Sans',
                                                                      color: Color.fromRGBO(
                                                                          13,
                                                                          91,
                                                                          196,
                                                                          1)),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    children: [
                                                      FutureBuilder<FormateApi>(
                                                          future: futureFormate,
                                                          builder: (context,
                                                              snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return Text(snapshot
                                                                          .data
                                                                          .data[
                                                                              0]
                                                                          .currencyformat
                                                                          .toString()) !=
                                                                      null
                                                                  ? Container(
                                                                      child:
                                                                          AutoSizeText(
                                                                        snapshot
                                                                            .data
                                                                            .data[0]
                                                                            .currencyformat
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              30,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontFamily:
                                                                              'Nunito Sans',
                                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                                        ),
                                                                        maxFontSize:
                                                                            23,
                                                                        minFontSize:
                                                                            15,
                                                                        maxLines:
                                                                            1,
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      child: Text(
                                                                          ' '));
                                                            } else {
                                                              return Text('');
                                                            }
                                                          }),
                                                      Text(
                                                                snapshot
                                                                    .data
                                                                    .data[0]
                                                                    .earnings
                                                                    .toString(),
                                                              ) !=
                                                              null
                                                          ? new Container(
                                                              child:
                                                                  AutoSizeText(
                                                                snapshot
                                                                    .data
                                                                    .data[0]
                                                                    .earnings
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 30,

                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  //      color: Color.fromRGBO(255, 255, 255, 1)
                                                                ),
                                                                maxFontSize: 23,
                                                                minFontSize: 15,
                                                                maxLines: 1,
                                                              ),
                                                            )
                                                          : new Container(
                                                              child: Text('0',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Nunito Sans',
                                                                  ))),
                                                      /*   Text(
                                                        '.50',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          //      color: Color.fromRGBO(255, 255, 255, 1)
                                                        ),
                                                      ),*/
                                                      SizedBox(
                                                        width: 18,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                                //Slider Container properties
                                options: CarouselOptions(
                                  reverse: false,
                                  initialPage: 2,
                                  enlargeCenterPage: true,
                                  viewportFraction: 3.0,
                                  enableInfiniteScroll: false,
                                  //      enableInfiniteScroll: true,
                                  //  aspectRatio: 30 / 9,
                                  //    autoPlay: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 330,
                          left: 20,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromRGBO(0, 214, 214, 1),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: Offset(3.0, 5.0),
                                    blurRadius: 1.0,
                                  )
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 19,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Image.asset(
                                              "images/08-shift@2x.png",
                                              height: size.height * 0.05,

                                              // fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Active Shift Count',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Color.fromRGBO(
                                                            112, 112, 112, 1)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            AutoSizeText(
                                              snapshot.data.data[0].shifts
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Nunito Sans',
                                                //      color: Color.fromRGBO(255, 255, 255, 1)
                                              ),
                                              maxFontSize: 23,
                                              minFontSize: 15,
                                              maxLines: 1,
                                            ),
                                            SizedBox(
                                              width: 18,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 420,
                          left: 20,
                          right: 20,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color.fromRGBO(212, 144, 255, 1),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: Offset(3.0, 5.0),
                                    blurRadius: 1.0,
                                  )
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 19,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Image.asset(
                                              "images/Group 12123@2x.png",
                                              height: size.height * 0.05,

                                              // fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  AutoSizeText(
                                                    'Pending Balance',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Color.fromRGBO(
                                                            112, 112, 112, 1)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          FutureBuilder<FormateApi>(
                                              future: futureFormate,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(snapshot
                                                              .data
                                                              .data[0]
                                                              .currencyformat
                                                              .toString()) !=
                                                          null
                                                      ? Container(
                                                          child: AutoSizeText(
                                                            snapshot
                                                                .data
                                                                .data[0]
                                                                .currencyformat
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              //      color: Color.fromRGBO(255, 255, 255, 1)
                                                            ),
                                                            maxFontSize: 23,
                                                            minFontSize: 15,
                                                            maxLines: 1,
                                                          ),
                                                        )
                                                      : Container(
                                                          child: Text(' '));
                                                } else {
                                                  return Text('');
                                                }
                                              }),
                                          AutoSizeText(
                                            // '123',
                                            snapshot.data.data[0].pending
                                                .toString(),
                                            //    maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              //  fontFamily: 'Nunito Sans',

                                              //      color: Color.fromRGBO(255, 255, 255, 1)
                                            ),
                                            maxFontSize: 23,
                                            minFontSize: 15,
                                            maxLines: 1,
                                            //     overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 18,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            top: 525,
                            left: 23,
                            right: 20,
                            child: Container(
                              child: Text(
                                'Recent Assignments',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Nunito Sans',
                                    color: Color.fromRGBO(13, 91, 196, 1)),
                              ),
                            )),
                        Positioned(
                          top: 570,
                          left: 23,
                          right: 20,
                          child: Container(
                            height: 100.0,
                            child: snapshot.data.data[0].assignments.length == 0
                                ? Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      'No Assignment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Nunito Sans',
                                          color:
                                              Color.fromRGBO(112, 112, 112, 1)),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                        .data.data[0].assignments.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 4.0,
                                        shadowColor:
                                            Colors.grey.withOpacity(0.2),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          textBaseline: TextBaseline.alphabetic,
                                          children: [
                                            //////////////////////
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        20, 0, 120, 0),
                                                    child: Text(
                                                      snapshot
                                                          .data
                                                          .data[0]
                                                          .assignments[0]
                                                          .jobTitle,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Nunito Sans',
                                                          color: Color.fromRGBO(
                                                              13, 91, 196, 1)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 11,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                snapshot
                                                    .data
                                                    .data[0]
                                                    .assignments[index]
                                                    .customerName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Nunito Sans',
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1)),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 9,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                  snapshot
                                                              .data
                                                              .data[0]
                                                              .assignments[0]
                                                              .startDate !=
                                                          null
                                                      ? DateFormat('yyyy/M/d')
                                                          .format(DateTime
                                                              .parse(snapshot
                                                                  .data
                                                                  .data[0]
                                                                  .assignments[
                                                                      0]
                                                                  .startDate))
                                                      : ' - - - ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Nunito Sans',
                                                      color: Color.fromRGBO(
                                                          31, 33, 38, 1))),

                                              /* Text(
                                            tiledate.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Nunito Sans',
                                                color: Color.fromRGBO(
                                                    31, 33, 38, 1)),
                                          ),*/
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              // print('jjjjjjjjj');
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
            }

            // By default, show a loading spinner.
          },
        ),
      ),

      /**/
    );
  }
}
