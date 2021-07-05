import 'package:flutter/material.dart';

class AssignmentScreen extends StatefulWidget {
  // const AssignmentScreen({ Key? key }) : super(key: key);

  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Assignments'),
      ),
      body: new Center(
        child: new Text('This is assignemnt page.'),
      ),
    );
  }
}
