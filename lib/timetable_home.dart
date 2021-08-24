import 'package:flutter/material.dart';
import 'package:vacation_project/setting.dart';
import 'package:vacation_project/timetable.dart';

import 'friend_register.dart';
import 'friend_show.dart';
import 'timetable_register.dart';

class TimetableHome extends StatefulWidget {
  @override
  TimetableHomeState createState() => TimetableHomeState();
}

class TimetableHomeState extends State<TimetableHome> {
  final List<List<String>> tableData = [
    ["교시", "월", "화", "수", "목", "금"],
    ["1", " ", " ", " ", " ", "실전\n프로젝트"],
    ["2", " ", "실전\n프로젝트", " ", " ", "실전\n프로젝트"],
    ["3", "컴퓨터\n구조", "웹 서비스\n개발", " ", "컴퓨터\n구조", "이산수학"],
    ["4", " ", " ", " ", " ", " "],
    ["5", " ", "이산수학", "채플", " ", "이산수학"],
    ["6", "환경과\n인간", " ", "팀모임", "환경과\n인간", " "],
    ["7", " ", " ", " ", " ", " "],
    ["8", " ", " ", " ", " ", " "],
    ["9", " ", " ", " ", " ", " "],
  ];

  final List<String> noColor = [
    "교시",
    "월",
    "화",
    "수",
    "목",
    "금",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아니 이거 왜 안돼',
      home: Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("아니 이거 왜 안돼"),
                  accountEmail: Text("whyNot@handong.edu"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/user.png'),
                  ),
                  // otherAccountsPictures: [
                  //   CircleAvatar(backgroundColor: Colors.white, backgroundImage: AssetImage('images/user.png'),),
                  // ],
                  onDetailsPressed: () => {
                    print("show detail."),
                  },
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.calendar_today,
                    color: Colors.grey[850],
                  ),
                  title: Text("시간표 등록"),
                  onTap: () {
                    // Listtile 자체의 ontap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TimetableRegister()),
                    );
                  },
                  //trailing: Icon(Icons.add),
                ),
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Colors.grey[850],
                  ),
                  title: Text("친구 목록"),
                  onTap: () {
                    // Listtile 자체의 ontap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FriendShow()),
                    );
                  },
                  //trailing: Icon(Icons.add),
                ),
                ListTile(
                  leading: Icon(
                    Icons.add,
                    color: Colors.grey[850],
                  ),
                  title: Text("친구 등록"),
                  onTap: () {
                    // Listtile 자체의 ontap
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FriendRegister()),
                    );
                  },
                  //trailing: Icon(Icons.add),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('홈'),
            centerTitle: true,
            backgroundColor: Color(0xFF3A70AF),
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
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .black,
                                                                  )),
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
                                                              color: Colors
                                                                  .blue[200],
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black)),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              i.toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black))),
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
          '시간표',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}   // 시간표 틀 구현 (DB 연결 필요)
