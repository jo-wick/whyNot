import 'package:flutter/material.dart';
import 'package:vacation_project/timetable.dart';

class TimetableCompare extends StatefulWidget {
  @override
  TimetableCompareState createState() => TimetableCompareState();
}

class TimetableCompareState extends State<TimetableCompare> {
  final List<List<String>> tableData = [
    ["교시", "월", "화", "수", "목", "금"],
    ["1", " ", " ", " ", " ", " "],
    ["2", " ", " ", " ", " ", " "],
    ["3", " ", " ", " ", " ", " "],
    ["4", " ", " ", " ", " ", " "],
    ["5", " ", " ", " ", " ", " "],
    ["6", " ", " ", " ", " ", " "],
    ["7", " ", " ", " ", " ", " "],
    ["8", " ", " ", " ", " ", " "],
    ["9", " ", " ", " ", " ", " "],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아니 이거 왜 안돼',
      home: Scaffold(
          appBar: AppBar(
            title: Text('시간표 비교'),
            centerTitle: true,
            backgroundColor: Color(0xFF3A70AF),
            leading: IconButton(
              alignment: Alignment.center,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => Timetable2()),
                );
              },
            ),
          ),
          body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _text1(),
                  Container(
                      margin: EdgeInsets.all(10.0),
                      width: 500.0,
                      height: 520.0,
                      child: Column(
                          children: this
                              .tableData
                              .map<Widget>((List<String> l) => Expanded(
                                    child: Row(
                                        children: l
                                            .map<Widget>((String i) => Expanded(
                                                  child: (i == " " ||
                                                          i == "1" ||
                                                          i == "2" ||
                                                          i == "3" ||
                                                          i == "4" ||
                                                          i == "5" ||
                                                          i == "6" ||
                                                          i == "7" ||
                                                          i == "8" ||
                                                          i == "9" ||
                                                          i == "교시" ||
                                                          i == "월" ||
                                                          i == "화" ||
                                                          i == "수" ||
                                                          i == "목" ||
                                                          i == "금")
                                                      ? Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              i.toString(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              )))
                                                      : Container(
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xff5b8dc9),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              i.toString(),
                                                              style:
                                                                  TextStyle(color: Colors.black))),
                                                ))
                                            .toList()),
                                  ))
                              .toList())),
                ],
              ))),
    );
  }

  Widget _text1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 20.0),
        Text(
          '송다빈, 윤지인 외 2명',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
