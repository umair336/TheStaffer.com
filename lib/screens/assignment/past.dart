import 'package:flutter/material.dart';

class Past extends StatefulWidget {
  // const Past({ Key? key }) : super(key: key);

  @override
  _PastState createState() => _PastState();
}

class _PastState extends State<Past> {

  final List dummyList = List.generate(5, (index) {
    return {
      "id": index,
      "title": "This is the title $index",
      "subtitle": "This is the subtitle $index"
    };
  });
   // Handler called when the "sort" button on appbar is clicked.
  

  @override
  Widget build(BuildContext context) {
   return Scaffold(
        body: SafeArea(
          child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) => Card(
            elevation: 6,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(dummyList[index]["id"].toString()),
                backgroundColor: Colors.purple,
              ),
              title: Text(dummyList[index]["title"]),
              subtitle: Text(dummyList[index]["subtitle"]),
              trailing: Icon(Icons.add_a_photo),
            ),
          ),
    )));
  }
}



