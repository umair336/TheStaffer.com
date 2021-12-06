import 'package:flutter/material.dart';
import 'breakmodelclasss.dart';

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
                                    Container(
                                        child:
                                            widget.timer.paidunpaid == 'Unpaid'
                                                ? Image.asset(
                                                    "images/Path 57125@2x.png",
                                                    height: 13,
                                                    color: Color.fromRGBO(
                                                        13, 91, 196, 1)
                                                    // fit: BoxFit.cover,
                                                    )
                                                : Image.asset(
                                                    "images/Path 57125@2x.png",
                                                    height: 13,
                                                    color: Colors.red.shade800

                                                    // fit: BoxFit.cover,
                                                    )),
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
                                  Container(
                                      child: widget.timer.paidunpaid == 'Unpaid'
                                          ? Image.asset(
                                              "images/Path 57125@2x.png",
                                              height: 13,
                                              color:
                                                  Color.fromRGBO(13, 91, 196, 1)

                                              // fit: BoxFit.cover,
                                              )
                                          : Image.asset(
                                              "images/Path 57125@2x.png",
                                              height: 13,
                                              color: Colors.red.shade800
                                              // fit: BoxFit.cover,
                                              )),
                                  SizedBox(
                                    width: 2,
                                  )
                                ],
                              ),
                            ),
                          )),
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
        ],
      ),
    );
  }
}
