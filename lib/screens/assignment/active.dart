import 'package:flutter/material.dart';

class Active extends StatefulWidget {
  // const Active({ Key? key }) : super(key: key);

  @override
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      body: new Center(
        child: new Text('This is active assignment listing'),
      ),
    );
  }
}