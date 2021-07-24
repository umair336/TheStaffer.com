import 'package:flutter/material.dart';
import './active.dart';
import './past.dart';
import './upcoming.dart';


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
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff5808e5),
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
      ),
    );
  }
}

