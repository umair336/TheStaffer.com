import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  // const Upcoming({ Key? key }) : super(key: key);

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {

   final List dummyList = List.generate(5, (index) {
    return {
      "id": index,
      "title": "This is the title $index",
      "subtitle": "This is the subtitle $index"
    };
  });
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Container(
          child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(20),
            width: 120,
            height: 120,
            margin: EdgeInsets.only(
              left: 30,
              right:30,
              top: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(
                color: Colors.blue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(7)
            ),
          
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Job title come here",
                            style: TextStyle(
                            color: Colors.black,
                                fontWeight: FontWeight.w600,
                            fontSize: 19.0)),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text("Start Date",
                          style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12.0)
                        ),

                        Text("Jan: 00,2000",
                            style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 19.0
                            )
                          ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text("End Date",
                            style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 12.0)),
                        Text("Jan: 00,2000",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 19.0)),

                      ],
                    ),
                  ]
                ),
              ]
            ),
            
          ),
    )));
  }
}

