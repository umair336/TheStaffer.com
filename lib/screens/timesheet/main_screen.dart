// // TODO Implement this library.
//
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:staffer/screens/timesheet/addtimesheet.dart';
import 'package:staffer/screens/timesheet/break_model.dart';

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
//
// class MyApppp extends StatefulWidget {
//   const MyApppp({Key key}) : super(key: key);
//
//   @override
//   MyAppppState createState() {
//     return MyAppppState();
//   }
// }
//
// class MyAppppState extends State<MyApppp> {
//   final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
//
//   @override
//   Widget build(BuildContext context) {
//     const title = 'Dismissing Items';
//
//     return MaterialApp(
//       title: title,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(title),
//         ),
//         body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final item = items[index];
//             return Dismissible(
//               // Each Dismissible must contain a Key. Keys allow Flutter to
//               // uniquely identify widgets.
//               key: Key(item),
//               // Provide a function that tells the app
//               // what to do after an item has been swiped away.
//               onDismissed: (direction) {
//                 // Remove the item from the data source.
//                 setState(() {
//                   items.removeAt(index);
//                 });
//
//                 // Then show a snackbar.
//                 ScaffoldMessenger.of(context)
//                     .showSnackBar(SnackBar(content: Text('$item dismissed')));
//               },
//               // Show a red background as the item is swiped away.
//               background: Container(color: Colors.red),
//               child: ListTile(
//                 title: Text(item),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//TODO: ContactRow Class (Screen)
class ContactRow extends StatefulWidget {
  final Function() callBackFun;
  final BreakModel breakModel;
  final List<BreakModel> timeList;

  ContactRow({
    this.callBackFun,
    this.breakModel,
    this.timeList,
  });

  @override
  State<StatefulWidget> createState() => new _ContactRow();
}

class _ContactRow extends State<ContactRow> {
  // int _countContactRow = 1;
  DateTime now = DateTime.now();

  String _seletedTime = "00:00 ";
  String _seletTime = "00:00";
  bool endtime = false;
  TimeOfDay _qq;
  TimeOfDay _ww;
  String breakk = "";
  @override
  void initState() {
    super.initState();

    _qq = TimeOfDay.now();
    _ww = TimeOfDay.now();
  }
  //TODO: delete counter method

  @override
  Widget build(BuildContext context) {
    //start time
    Future<void> _openTimePiker(
        BuildContext context, BreakModel breakTimePassed) async {
      final TimeOfDay t =
          await showTimePicker(context: context, initialTime: _qq);

      if (t != null) {
        setState(() {
          // _seletedTime = t.format(context);
          breakTimePassed.startTime = t.format(context);
          _qq = t;
          endtime = true;
          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ');
          print(_seletedTime);
        });
      }
    }

    Future<void> _openTimePikerr(
        BuildContext context, BreakModel breakTimePassed) async {
      if (endtime == true) {
        final TimeOfDay p =
            await showTimePicker(context: context, initialTime: _ww);

        if (p != null) {
          breakTimePassed.endTime = p.format(context);
          breakTimePassed.isEndTimeSelected = true;
          _ww = p;

          setState(() {});
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Select break Start time"),
          backgroundColor: Color.fromRGBO(183, 14, 105, 1),
        ));
      }

      bool isAllTimeSelect = false;

      for (BreakModel br in widget.timeList) {
        if (br.isEndTimeSelected) {
          isAllTimeSelect = true;
        } else {
          isAllTimeSelect = false;
        }
      }
    }

    // List<Widget> _contatos = new List.generate(_count, (int i) => new ContactRow());

    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    _openTimePiker(
                      context,
                      widget.breakModel,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Start Time',
                                    style: TextStyle(
                                        //    fontWeight: FontWeight.bold,
                                        fontSize: 10.0,
                                        color:
                                            Color.fromRGBO(112, 112, 112, 1)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.breakModel.startTime,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              "images/Path 57125@2x.png",
                              height: 15,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10),

              Expanded(
                  child: InkWell(
                onTap: () {
                  _openTimePikerr(
                    context,
                    widget.breakModel,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'End Time',
                                  style: TextStyle(
                                      //    fontWeight: FontWeight.bold,
                                      fontSize: 10.0,
                                      color: Color.fromRGBO(112, 112, 112, 1)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.breakModel.endTime,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "images/Path 57125@2x.png",
                            height: 15,
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),

              SizedBox(
                width: 6,
              ),

              // //Todo: delete button

              InkWell(
                onTap: () {
                  // _deleteItems();
                  setState(() {
                    widget.callBackFun();
                  });
                  print('delete');
                },
                child: Image.asset(
                  "images/003-trash@2x.png",
                  width: 17,

                  // fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
