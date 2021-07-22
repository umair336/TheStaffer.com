import 'package:flutter/material.dart';

class TimesheetScreen extends StatefulWidget {
  // const TimesheetScreen({ Key? key }) : super(key: key);

  @override
  _TimesheetScreenState createState() => _TimesheetScreenState();
}

class _TimesheetScreenState extends State<TimesheetScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TimeSheet'),
      ),
      body: new Center(
        child: new Text('This is a timesheet page.'),
      ),
    );
  }
}

