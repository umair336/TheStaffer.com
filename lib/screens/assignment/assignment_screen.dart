import 'package:flutter/material.dart';

import './activeAssignment.dart';
import './upcomingAssignment.dart';
import './pastAssignment.dart';
import './assignmentapi.dart';

class AssignmentScreen extends StatefulWidget {
  // const AssignmentScreen({ Key? key }) : super(key: key);

  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  //  final List<TabInfo> _tabs = [
  //   TabInfo("SAN CLEMENTE", Active()),
  //   TabInfo("HUNTINGTON BEACH", Past()),
  //   TabInfo("SHAKE SHACK", Upcoming()),
  // ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignments',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Assignments'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
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
              )
                  /*
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    Color.fromRGBO(0, 91, 196, 1),
                    Color.fromRGBO(97, 29, 165, 1),
                  ])*/
                  ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Upcoming'),
                Tab(text: 'Finished'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Activeassignment(),
              Upcomingassignment(),
              PastAssignment()
            ],
          ),
        ),
      ),
      /*DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Assignments'),
            automaticallyImplyLeading: false,
            //  backgroundColor: Color(0xff5808e5),
            flexibleSpace: Container(
              decoration: BoxDecoration(
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
              )
                  /*
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                    Color.fromRGBO(0, 91, 196, 1),
                    Color.fromRGBO(97, 29, 165, 1),
                  ])*/
                  ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Upcoming'),
                Tab(text: 'Past'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Active(),
              Upcoming(),
              Past(),
            ],
          ),
        ),
      ),*/
    );
  }
}
