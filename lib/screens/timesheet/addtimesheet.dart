import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:staffer/screens/main_screen/main_screen.dart';
import './timesheet_screen.dart';
import './main_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

String _addbreak = "";

class Addtimesheet extends StatefulWidget {
  @override
  _AddtimesheetState createState() => _AddtimesheetState();
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}

class _AddtimesheetState extends State<Addtimesheet> {
  // ContactRow contact = ContactRow();

  int _count = 1;
  int _value = 1;
  List totalbreak = [];
  List breaktime = [];
  List<String> numbers = [];
  List<ListItem> _dropdownItems = [
    ListItem(1, "one Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];
  DateTime now = DateTime.now();
  // String _seletedTime = DateFormat('h:mm a').format(DateTime.now());
  //String _seletTime = DateFormat('h:mm a').format(DateTime.now());
  String _seletedTime = "00:00 ";
  String _seletTime = "00:00";
  String start = "";
  String startDate = DateFormat('EEE d MMM, y ').format(DateTime.now());
  TimeOfDay _t;
  TimeOfDay _pp;
  String time = "";

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    loadData(startDate);
    _t = TimeOfDay.now();
    _pp = TimeOfDay.now();
  }

  void loadData(start) {
    print('------date-----');
    print(start);
    print('------time-----');
    // var now = new DateTime.now();

    //  String formattedTime = DateFormat('kk:mm:a').format(now);
    // print(formattedTime);

    final Object _data = {
      "customer": "",
      "start_date": "Aug 22, 2021",
      "end_date": "Sep 04, 2021",
      //"start_date": start,
      //"end_date": end,
      "vendors": "",
      "week_ends": "",
      "branch": "",
      "date_format": "M",
    };
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Future<void> _openTimePicker(BuildContext context) async {
      final t = await showTimePicker(context: context, initialTime: _t);

      if (t != null) {
        setState(() {
          _seletedTime = t.format(context);
          _t = t;
          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $t');
          print(_seletedTime);
        });
      }
    }

    Future<void> _openTimePiker(BuildContext context) async {
      final p = await showTimePicker(context: context, initialTime: _pp);

      if (p != null) {
        setState(() {
          _seletTime = p.format(context);
          _pp = p;
          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
          print(_seletTime);
        });
      }
    }

    // final items = ContactRow();
    //  ContactRow contactRow = new ContactRow();
    List<Widget> _contatos =
        new List.generate(_count, (int i) => new ContactRow());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                      0.1,
                      0.5,
                    ],
                    colors: [
                      Color.fromRGBO(0, 91, 196, 1),
                      Color.fromRGBO(97, 29, 165, 1),
                    ],
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 7, 0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          'Add Time Sheet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(13, 91, 196, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              _selectStart(context);

                              //      Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => Loginorsignup()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            'Date',
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
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            startDate,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.0,
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1)),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 20, 0),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Image.asset(
                                      "images/Path 57123@2x.png",
                                      height: size.height * 0.02,
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Time Out',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(13, 91, 196, 1)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    _openTimePicker(context);
                                  },
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 5, 0, 0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Start Time',
                                                  style: TextStyle(
                                                      //    fontWeight: FontWeight.bold,
                                                      fontSize: 10.0,
                                                      color: Color.fromRGBO(
                                                          112, 112, 112, 1)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 5, 0, 0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  _seletedTime,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1)),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 5, 5, 0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            "images/Path 57125@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                child: InkWell(
                                  onTap: () {
                                    _openTimePiker(context);
                                  },
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 5, 0, 0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  _seletTime,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 1)),
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
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 5, 5, 0),
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Image.asset(
                                            "images/Path 57125@2x.png",
                                            height: size.height * 0.02,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Breaks',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Color.fromRGBO(13, 91, 196, 1)),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    child: new TextButton(
                                      // onPressed: _addNewContactRow,
                                      onPressed: () {
                                        setState(() {
                                          if (_count == 1) {
                                            _count = _count;
                                          } else {
                                            _count = _count - 1;
                                          }
                                        });
                                      },
                                      child: Image.asset(
                                        "images/image202.png",
                                        height: size.height * 0.04,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: new TextButton(
                                      onPressed: _addNewContactRow,
                                      child: Image.asset(
                                        "images/Group 12823@2x.png",
                                        height: size.height * 0.04,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                  /* Container(
                                    child: new TextButton(
                                      onPressed: () => setState(() {
                                        numbers.add(" $_count ");
                                        _count++;
                                      }),
                                      child: Image.asset(
                                        "images/Group 12823@2x.png",
                                        height: size.height * 0.04,
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),*/
                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                      height: 180.0,
                      child: new ListView(
                        children: _contatos,
                        scrollDirection: Axis.vertical,
                      ),
                    ),

                    /* SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      itemCount: numbers.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: contact),
                          /*
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
                            child: Row(
                              children: [
                                 Expanded(child: contact),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      child: InkWell(
                                        onTap: () {
                                          _openTimePicker(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                children: [
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 5, 0, 0),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        'Start Time',
                                                        style: TextStyle(
                                                            //    fontWeight: FontWeight.bold,
                                                            fontSize: 10.0,
                                                            color:
                                                                Color.fromRGBO(
                                                                    112,
                                                                    112,
                                                                    112,
                                                                    1)),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 5, 0, 0),
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        _seletedTime,
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
                                                  SizedBox(
                                                    height: 8,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 5, 5, 0),
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Image.asset(
                                                  "images/Path 57125@2x.png",
                                                  height: size.height * 0.02,
                                                  // fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                        _openTimePiker(context);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.baseline,
                                              textBaseline:
                                                  TextBaseline.alphabetic,
                                              children: [
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 5, 0, 0),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'End Time',
                                                      style: TextStyle(
                                                          //    fontWeight: FontWeight.bold,
                                                          fontSize: 10.0,
                                                          color: Color.fromRGBO(
                                                              112,
                                                              112,
                                                              112,
                                                              1)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20, 5, 0, 0),
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      _seletTime,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 1)),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 5, 5, 0),
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset(
                                                "images/Path 57125@2x.png",
                                                height: size.height * 0.02,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),*/
                          //   SizedBox(
                          //   width: 14,
                          // ),

                          InkWell(
                            onTap: () {
                              //Navigator.of(context).pop(true);
                              setState(() {
                                numbers.removeAt(index);
                                print("remove index is$numbers[index]");
                              });
                            },
                            child: Container(
                                child: Image.asset(
                              "images/003-trash@2x.png",
                              height: 20,
                              fit: BoxFit.cover,
                            )),
                          ),
                          Text(numbers[index]),

                          // call the class in this line
                          /*TextButton(
                              onPressed: () {
                                setState(() {
                                  // int removeIndex = numbers.indexOf(numbers[index]);
                                  numbers.removeAt(index);
                                  // print(removeIndex);
                                });
                              },
                              child: Text('button')),
                          Text(numbers[index]),*/
                        ],
                      ),
                    ),
                    */
                    SizedBox(
                      height: 40,
                    ),
                    /*
                    new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _contatos,
                    ),
                    */

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Total Time:',
                              style: TextStyle(
                                  //    fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  time.toString() ?? "select time",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(13, 91, 196, 1)),
                                ),
                                /*  Text(
                                  hours.toString() ?? "select time",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(13, 91, 196, 1)),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(':'),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  mints.toString() ?? "select time",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(13, 91, 196, 1)),
                                ),
                                */
                              ],
                            ),
                            SizedBox(
                              width: 13,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 70,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 1.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: DropdownButton(
                                            value: _value,
                                            items: _dropdownItems
                                                .map((ListItem item) {
                                              return DropdownMenuItem<int>(
                                                child: Text(item.name),
                                                value: item.value,
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              setState(() {
                                                _value = value;
                                              });
                                            },
                                            hint: Text("Select item"),
                                            disabledHint: Text("Disabled"),
                                            elevation: 8,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1),
                                                fontSize: 16),
                                            //  icon: Icon(Icons.arrow_drop_down_circle),
                                            iconDisabledColor: Colors.red,
                                            iconEnabledColor:
                                                Color.fromRGBO(183, 14, 105, 1),
                                            isExpanded: true,
                                            underline: Container(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 13,
                              child: Container(
                                  color: Colors.white,
                                  child: Text(
                                    'Assignments',
                                    style: TextStyle(

                                        // fontWeight: FontWeight.bold,

                                        fontSize: 13.0,
                                        color: Color.fromRGBO(83, 83, 83, 1)),
                                  )),
                            ),
                            Positioned(
                              right: 20,
                              top: 35,
                              child: Container(
                                color: Colors.white,
                                child: Image.asset(
                                  "images/icon-navigation-chevron_left_24px@2x.png",
                                  height: size.height * 0.03,
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 82,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      border: Border.all(
                                          color: Colors.grey.shade200,
                                          width: 1.0),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Container(
                                            height: 60,
                                            child: TextField(
                                              maxLines: 3,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText:
                                                    'Lorem ipsum dolor sit amet, consetetur   sadipscing elitr, sed diam nonumy eirmod    tempor invidunt ut labore et ',
                                                //      maxLines: 3,
                                                hintStyle: TextStyle(

                                                    // fontWeight: FontWeight.bold,

                                                    fontSize: 14.0,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              bottom: 69,
                              child: Container(
                                  color: Colors.white,
                                  child: Text(
                                    'Shift Notes',
                                    style: TextStyle(

                                        // fontWeight: FontWeight.bold,

                                        fontSize: 13.0,
                                        color: Color.fromRGBO(83, 83, 83, 1)),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                //   color: Color.fromRGBO(23, 197, 204, 1),
                height: 45,
                // height: MediaQuery.of(context).size.height * 0.08,
                width: 315,
                child: TextButton(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(13, 91, 196, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                        //   side: BorderSide(color: Colors.red.shade900),
                      ),
                    ),
                  ),
                  //      color: Colors.black,
                  //  textColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    breaktime.add(
                      _seletedTime,
                    );
                    breaktime.add(
                      _seletTime,
                    );

                    setState(() {
                      var format = DateFormat("hh:mm a");
                      var starttime = format.parse(_seletedTime);
                      var endtime = format.parse(_seletTime);

                      print('bbbbbbbbbbbbbbbbbbbbbb$starttime and $endtime');
                      if (starttime.isAfter(endtime)) {
                        print('start is big');
                        print('difference = ${starttime.difference(endtime)}');
                        // time = starttime.difference(endtime).toString();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "plz select accurate time of the day between 0 to 24"),
                          backgroundColor: Color.fromRGBO(13, 91, 196, 1),
                        ));
                      } else if (starttime.isBefore(endtime)) {
                        print('end is big'); // correct val
                        print('difference = ${endtime.difference(starttime)}');
                        time = endtime.difference(starttime).toString();
                      } else {
                        print(
                            'difference === ${endtime.difference(starttime)}');
                        time = endtime.difference(starttime).toString();
                      }
                    });

                    //     numbers.add();

                    // print(breaktime);

                    totalbreak.add(breaktime);

                    print("start Date is $startDate");
                    print("check in $_seletedTime");
                    print("check out $_seletTime,");
                    print("Assignment is $_value,");
                    print("Break timings is  $totalbreak ");
                    breaktime.removeLast();
                    breaktime.removeLast();
//   print("Break timings is  $breaktime  endtime $breaktime");
                    print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%$_addbreak");
                    var format = DateFormat("HH:mm");
                    var ss = format.parse(time);
                    var ee = format.parse(_addbreak);
                    print(
                        'difference========================== = ${ss.difference(ee)}');
                    time = ss.difference(ee).toString();
                    print("##############################$time");

                    //     Navigator.push(context,
                    //            MaterialPageRoute(builder: (context) => Profile()));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            /*
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                //   color: Color.fromRGBO(23, 197, 204, 1),
                height: 45,
                // height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.92,
                child: TextButton(
                  child: Text(
                    _seletedTime,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(13, 91, 196, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                        //   side: BorderSide(color: Colors.red.shade900),
                      ),
                    ),
                  ),
                  //      color: Colors.black,
                  //  textColor: Colors.white,
                  //     shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    _openTimePicker(context);
                  },
                ),
              ),
            ),*/
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  _selectStart(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color.fromRGBO(13, 91, 196, 1),
            accentColor: const Color.fromRGBO(13, 91, 196, 1),
            colorScheme: ColorScheme.light(
              primary: const Color.fromRGBO(13, 91, 196, 1),
            ),
          ),
          child: child,
        );
      },
    );
    if (selected != null)
      setState(() {
        startDate = DateFormat('EEE d, y').format(selected);
      });
  }

  void _addNewContactRow() {
    setState(() {
      _count = _count + 1;
    });
  }
}

class ContactRow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ContactRow();
}

class _ContactRow extends State<ContactRow> {
  DateTime now = DateTime.now();

  String _seletedTime = "00:00 ";
  String _seletTime = "00:00";
  TimeOfDay _qq;
  TimeOfDay _ww;
  String breakk = "";
  @override
  void initState() {
    super.initState();

    _qq = TimeOfDay.now();
    _ww = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _openTimePiker(BuildContext context) async {
      final TimeOfDay t =
          await showTimePicker(context: context, initialTime: _qq);

      if (t != null) {
        setState(() {
          _seletedTime = t.format(context);
          _qq = t;

          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ');
          print(_seletedTime);
        });
      }
    }

    Future<void> _openTimePikerr(BuildContext context) async {
      final TimeOfDay p =
          await showTimePicker(context: context, initialTime: _ww);

      if (p != null) {
        setState(() {
          _seletTime = p.format(context);
          _ww = p;
          print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae');
          print(_seletTime);
          var format = DateFormat("hh:mm a");
          var start = format.parse(_seletedTime);
          var end = format.parse(_seletTime);

          print('bbbbbbbbbbbbbbbbbbbbbb$start and $end');
          if (start.isAfter(end)) {
            breakk = start.isAfter(end).toString();
            print('start is big  select accurate time of the day');
            print('difference = ${start.difference(end)}');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  Text("plz select accurate time of the day between 0 to 24"),
              backgroundColor: Color.fromRGBO(13, 91, 196, 1),
            ));
          } else if (start.isBefore(end)) {
            breakk = end.difference(start).toString();
            _addbreak = breakk;
            print('end is big$breakk');
            print('difference = ${end.difference(start)}');
            print('bbbbbbbbbbbbbbbbbbbbbbbbb$breakk');
          } else {
            print('difference === ${end.difference(start)}');
            breakk = end.difference(start).toString();
            _addbreak = breakk;
            print('bbbbbbbbbbbbbbbbbbbbbbbbb$breakk');
          }
        });
      }
    }

    return new Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                                    _seletedTime,
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
                  _openTimePikerr(context);
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
                                  _seletTime,
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
