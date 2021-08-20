import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staffer/bloc/auth_bloc/auth.dart';
import 'package:staffer/style/theme.dart' as Style;

class Upcoming extends StatefulWidget {
  // const Upcoming({ Key? key }) : super(key: key);

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  void initState() {
    super.initState();
    final String _url = '/admin/employees/assignments/list';
    final Object _data = {
      "employee_id": "0",
      "date_format": "d%2Fm%2FY",
      "employee": "",
      "branch": "",
      "job_position": "",
    };
    BlocProvider.of<AuthenticationBloc>(context).add(
      FetchAssignmentEvent(url: _url, data: _data),
    );
  }

  final List dummyList = List.generate(5, (index) {
    return {
      "id": index,
      "title": "This is the title $index",
      "subtitle": "This is the subtitle $index"
    };
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AssignmentLoadedState) {
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
                right: 30,
                top: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(7)),
              child: Column(children: [
                Row(
                  children: <Widget>[
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
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
                Row(children: <Widget>[
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("Start Date",
                          style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          )),
                      Text("Jan: 00,2000",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 19.0)),
                    ],
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
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
                ]),
              ]),
            ),
          )
          )
          );
        }else{
         return Scaffold(  //loader
            body: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Style.Colors.mainColor),
                      strokeWidth: 4.0,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
