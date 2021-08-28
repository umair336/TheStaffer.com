import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:staffer/bloc/auth_bloc/auth.dart';
import 'package:staffer/style/theme.dart' as Style;

class Active extends StatefulWidget {
  @override
  _ActiveState createState() => _ActiveState();
}

class _ActiveState extends State<Active> {
  @override
  void initState() {
    super.initState();
    final String _url = '/admin/employees/assignments/list';
    final Object _data = {
      "status":"Active",
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AssignmentLoadedState) {
          return Scaffold(
              //   appBar: _appbar,
              appBar: AppBar(
                //  title: Text('Time Tracker'),

                centerTitle: true,
                toolbarHeight: 80,
                backgroundColor: Colors.grey.shade100,
                elevation: 0.0,
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                    child: Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    'A',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(183, 14, 105, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "images/Sorting Arrow.png",
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Z',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 255, 255, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        //      color: Colors.black,
                        //  textColor: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          //   Navigator.push(context,
                          //      MaterialPageRoute(builder: (context) => Profile()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                    child: Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(112, 112, 112, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "images/Sorting Arroww.png",
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(255, 255, 255, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        //      color: Colors.black,
                        //  textColor: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //borderRadius: BorderRadius.circular(30)),
                        onPressed: () {
                          //   Navigator.push(context,
                          //      MaterialPageRoute(builder: (context) => Profile()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              body: Container(
                  color: Colors.grey.shade100,
                  child: ListView.builder(
                      itemCount: state.assignments.length,
                      itemBuilder: (context, index) => Padding(
                            // padding: const EdgeInsets.all(20.0),
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  //   color: Colors.white60,
                                  border: Border.all(
                                    color: Color.fromRGBO(79, 171, 247, 1),
                                    width: 1,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(state.assignments[index]['job_position'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 19.0)),
                                          ),
                                        ),
                                        Image.asset(
                                          "images/Path 58358.png",
                                          height: size.height * 0.05,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(state.assignments[index]['customer'],
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  112, 112, 112, 1),
                                              //fontWeight: FontWeight.w600,
                                              fontSize: 10.0)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(18, 0, 20, 0),
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              Text("Start Date              ",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          112, 112, 112, 1),

                                                      //fon textAlign: TextAlign.left,tWeight: FontWeight.w600,
                                                      fontSize: 10.0)),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(state.assignments[index]['start_date'],
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                      //fontWeight: FontWeight.w600,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                              Text("Start Date              ",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          112, 112, 112, 1),

                                                      //fontWeight: FontWeight.w600,
                                                      fontSize: 10.0)),
                                              SizedBox(
                                                height: 2,
                                              ),
                                              Text(state.assignments[index]['end_date'] != null? state.assignments[index]['end_date']: '',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1),
                                                      //fontWeight: FontWeight.w600,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          )
                      )));
        } else {
          return Scaffold(
            //loader
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
