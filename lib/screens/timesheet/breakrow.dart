import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'breakmodelclasss.dart';
import 'addtimesheet.dart';

class Contact extends StatefulWidget {
  Breaktimeing timer;
  Contact(this.timer);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TimeOfDay _t;
  TimeOfDay _pp;
  String s = '00:00';
  String e = '00:00';
  bool selectstart = false;
  bool selectend = false;
  bool timeount_false = false;
  String breakdifference = "";
  bool isSwitched = false;
  var textValue = 'Unpaid';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Paid';
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Unpaid';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  void initState() {
    super.initState();

    _t = TimeOfDay.now();
    _pp = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _openTimePiker(BuildContext context) async {
      final t = await showTimePicker(context: context, initialTime: _t);

      if (t != null) {
        setState(() {
          widget.timer.seletTime = t.format(context);
          _t = t;
          selectstart = true;
          if (timeount_false == true) {
            ////
          }

          timeount_false = true;
        });
      }
    }

    Future<void> _openTimePikerr(BuildContext context) async {
      if (timeount_false == true) {
        final p = await showTimePicker(context: context, initialTime: _pp);
        if (p != null) {
          setState(() {
            widget.timer.seletedTime = p.format(context);
            _pp = p;
            selectend = true;
            ////
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Select Start time"),
            backgroundColor: Color.fromRGBO(183, 14, 105, 1)));
      }
    }

    return Container(
      child: Stack(
        //  fit: StackFit.passthrough,
        overflow: Overflow.visible,
        children: <Widget>[
          // Max Size
          Positioned(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: Container(
                //  color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _openTimePiker(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 5, 0, 0),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                // time,
                                                'Start Time',
                                                // widget.timer.paidunpaid,
                                                style: TextStyle(
                                                    //    fontWeight: FontWeight.bold,
                                                    fontSize: 10.0,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 5, 0, 0),
                                            child: Container(
                                              child: selectstart == true
                                                  ? Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        widget.timer.seletTime,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    1)),
                                                      ),
                                                    )
                                                  : Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        s,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    1)),
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                    ),
                                    /*   Container(
                                      child: Image.asset(
                                        "images/Path 57125@2x.png",
                                        height: 13,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),*/
                                    SizedBox(
                                      width: 2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              _openTimePikerr(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 5, 0, 0),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'End Time',
                                              style: TextStyle(
                                                  //    fontWeight: FontWeight.bold,
                                                  fontSize: 10.0,
                                                  color: Color.fromRGBO(
                                                      112, 112, 112, 1)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 5, 0, 0),
                                          child: Container(
                                            child: selectend == true
                                                ? Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      widget.timer.seletedTime,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1)),
                                                    ),
                                                  )
                                                : Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      e,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1)),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        )
                                      ],
                                    ),
                                  ),
                                  /*        Container(
                                    child: Image.asset(
                                      "images/Path 57125@2x.png",
                                      height: 13,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),*/
                                  SizedBox(
                                    width: 2,
                                  )
                                ],
                              ),
                            ),
                          )),
                          SizedBox(
                            width: 25,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 7,
            bottom: 0,
            left: 208,
            right: -25,
            child: Text(
              '$textValue',
              style: TextStyle(fontSize: 6),
            ),
          ),
          Positioned(
              top: 5,
              bottom: 5,
              left: 190,
              right: -25,
              child: Container(
                //   color: Colors.green,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.scale(
                          scale: 1,
                          child: Switch(
                            onChanged: toggleSwitch,
                            value: isSwitched,
                            activeColor: Colors.white,
                            activeTrackColor: Color.fromRGBO(183, 14, 105, 1),
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor:
                                Color.fromRGBO(112, 112, 112, 1),
                          )),
                    ]),
              ))
        ],
      ),
    );
  }
/*
  Functionfbreakcalculate() {
    print(
        "gggggggggggggggggggggggggggggggg${widget.timer.seletTime} gggggggggggggggggg${widget.timer.seletedTime}");
    var format = DateFormat("hh:mm a");
    var starttime = format.parse(widget.timer.seletTime);
    var endtime = format.parse(widget.timer.seletedTime);
    print('bbbbbbbbbbbbbbbbbbbbbb$starttime and $endtime');
    if (starttime.isAfter(endtime)) {
      print('start is big');
      print('difference = ${starttime.difference(endtime)}');
      breakdifference = starttime.difference(endtime).toString();
      String x = "24:00";
      var f = DateFormat("hh:mm");
      var c = f.parse(x);
      var b = f.parse(breakdifference);
      print('fffffffffffffffffffff$c ffffffffffffff$b');
      breakdifference = c.difference(b).toString();
    } else if (starttime.isBefore(endtime)) {
      print('end is big'); // correct val
      print('difference = ${endtime.difference(starttime)}');
      breakdifference = endtime.difference(starttime).toString();
      // time = time.substring(0, 4);
    } else {
      print('difference === ${endtime.difference(starttime)}');
      breakdifference = endtime.difference(starttime).toString();
      //ime = time.substring(0, 4);
    }

    print('dddddddddddddddddddddddd$breakdifference');
    removeTrailingZeros();
  }

  removeTrailingZeros() {
    breakdifference =
        breakdifference.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    print('gggggggggggggggggggggg$breakdifference');
    if (breakdifference.startsWith("-")) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text("your break is greater than job plz select accurate time "),
        backgroundColor: Color.fromRGBO(183, 14, 105, 1),
      ));
    } else {
      return breakdifference;
    }
  }
  */
}
