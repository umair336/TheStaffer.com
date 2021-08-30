import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import './XDDashboardPreviousWeek.dart';
import 'package:adobe_xd/page_link.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staffer/bloc/auth_bloc/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staffer/style/theme.dart' as Style;

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return new Scaffold(
        /*
        appBar: AppBar(
          backgroundColor: Style.Colors.mainColor,
          title: Text("STAFFER"),
          actions: [
            /*
            IconButton(
                icon: Icon(EvaIcons.logOutOutline),
                onPressed: () {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                    LoggedOut(),
                  );
                })
                */
          ],
        ),
        */
        backgroundColor: const Color(0xfffafafa),
        body: SingleChildScrollView(
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
                top: 60,
                left: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.perm_identity_rounded,
                    color: Color.fromRGBO(255, 255, 255, 1),
                    size: 40,
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: 70,
                left: 70,
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
                left: 70,
                child: Text(
                  'Wayne Richardson',
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
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          LoggedOut(),
                        );
                      })),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(79, 171, 247, 1),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    "images/002-schedule@2x.png",
                                    height: size.height * 0.05,

                                    // fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Hours',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  112, 112, 112, 1)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '13 JUN to 19 JUN',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  13, 91, 196, 1)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    ' 38',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      //      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
                                  ),
                                  Text(
                                    '.50',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      //      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
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
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 240,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromRGBO(254, 193, 45, 1),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset(
                                    "images/Group 12117@2x.png",
                                    height: size.height * 0.05,

                                    // fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Earnings',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  112, 112, 112, 1)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '13 JUN to 19 JUN',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              color: Color.fromRGBO(
                                                  13, 91, 196, 1)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    ' 1,260',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      //      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
                                  ),
                                  Text(
                                    '.50',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      //      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
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
                        height: 15,
                      ),
                    ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
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
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    ' 15',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      //      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        Text(
                                          'Pending Balance',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
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
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    ' 750',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      //      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
                                  ),
                                  Text(
                                    '.50',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      //      color: Color.fromRGBO(255, 255, 255, 1)
                                    ),
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
                child: new Container(
                  height: 100.0,
                  child: new ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return new Card(
                          elevation: 1.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        'Quality Assurance Engineer',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Nunito Sans',
                                            color:
                                                Color.fromRGBO(13, 91, 196, 1)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Chicago, IL',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Nunito Sans',
                                      color: Color.fromRGBO(83, 83, 83, 1)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'NOV 22, 2022',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Nunito Sans',
                                      color: Color.fromRGBO(31, 33, 38, 1)),
                                ),
                              )
                            ],
                          ));
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
