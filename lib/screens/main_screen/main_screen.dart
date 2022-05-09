import 'package:TheStafferEmployee/bloc/auth_bloc/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:TheStafferEmployee/style/theme.dart' as Style;
import 'package:TheStafferEmployee/screens/home/home_screen.dart';
import 'package:TheStafferEmployee/screens/assignment/assignment_screen.dart';
import 'package:TheStafferEmployee/screens/profile/profile_screen.dart';
import 'package:TheStafferEmployee/screens/timesheet/timesheet_screen.dart';
import 'package:adobe_xd/pinned.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}


/*
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> tabs = [
    HomeScreen(),
    TimesheetScreen(),
    AssignmentScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Style.Colors.mainColor,
      //   leading: Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: CircleAvatar(
      //       backgroundImage: NetworkImage(
      //           "https://yt3.ggpht.com/yti/ANoDKi5R5eJSjZigdWmIcZKFAtqwG4svMcAAN0Iyvw4j=s108-c-k-c0x00ffffff-no-rj"),
      //     ),
      //   ),
      //   title: Text("STAFFER"),
      //   actions: [
      //     IconButton(
      //         icon: Icon(EvaIcons.logOutOutline),
      //         onPressed: () {
      //           BlocProvider.of<AuthenticationBloc>(context).add(
      //             LoggedOut(),
      //           );
      //         })
      //   ],
      // ),

      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Style.Colors.mainColor,
        // iconSize: 30,
        // selectedFontSize: 10,
        // unselectedFontSize: 8,
        unselectedItemColor: Color.fromRGBO(83, 83, 83, 1),
        selectedItemColor: Color.fromRGBO(183, 14, 105, 1),
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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}*/
