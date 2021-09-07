import 'package:flutter/material.dart';

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
  int _value = 1;
  List<ListItem> _dropdownItems = [
    ListItem(1, "one Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 0, 7, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                    height: 23,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 5, 0, 0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 5, 0, 0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'JAN 00,2000',
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
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
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
                                              '00:00 AM',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
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
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 5, 5, 0),
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
                          SizedBox(width: 10),
                          Expanded(
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
                                            '00:00 AM',
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
                                      const EdgeInsets.fromLTRB(20, 5, 5, 0),
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
                          ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 5, 0),
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
                        )),
                    SizedBox(
                      height: 15,
                    ),
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
                            Text(
                              '00:00 hrs',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(13, 91, 196, 1)),
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
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: DropdownButton(
                            value: _value,
                            items: _dropdownItems.map((ListItem item) {
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
                                color: Color.fromRGBO(112, 112, 112, 1),
                                fontSize: 16),
                            //  icon: Icon(Icons.arrow_drop_down_circle),
                            iconDisabledColor: Colors.red,
                            iconEnabledColor: Color.fromRGBO(183, 14, 105, 1),
                            isExpanded: true,
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 80,
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
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Lorem ipsum dolor sit amet, consetetur   sadipscing elitr, sed diam nonumy eirmod    tempor invidunt ut labore et ',
                                            maxLines: 3,
                                            style: TextStyle(

                                                // fontWeight: FontWeight.bold,

                                                fontSize: 14.0,
                                                color: Color.fromRGBO(
                                                    112, 112, 112, 1)),
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
                              bottom: 61,
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
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        //    margin: EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
                        //   color: Color.fromRGBO(23, 197, 204, 1),
                        height: 50,
                        // height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.92,
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                            //     Navigator.push(context,
                            //            MaterialPageRoute(builder: (context) => Profile()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
