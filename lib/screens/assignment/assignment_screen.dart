import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import '../timesheet/timesheet_screen.dart';
import './activeAssignment.dart';
import './upcomingAssignment.dart';
import './pastAssignment.dart';
import './assignmentapi.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'dart:ffi';
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
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    //  _selectedIndex = index;
    print('qqqqqqqqqqqqqqqqqqqqqqq$index');
    if (index == 0) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      });
    } else if (index == 1) {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TimesheetScreen()));
      });
    } else if (index == 2) {
    /*  setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssignmentScreen(),
            ));
      });*/
    } else if (index == 3) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignments',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
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
