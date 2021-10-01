import 'package:flutter/material.dart';
import 'package:vacation_project/friend_delete.dart';
import 'package:vacation_project/setting.dart';
import 'package:vacation_project/timetable_home.dart';

import 'friend_register.dart';

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);
class FriendShow extends StatefulWidget {
  @override
  FriendShowState createState() => FriendShowState();
}

class FriendShowState extends State<FriendShow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아니 이거 왜 안돼',
      theme: theme ? _darkTheme : _lightTheme,
      home: Scaffold(
          appBar: AppBar(
            title: Text('친구 목록'),
            centerTitle: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => TimetableHome()),
                  );
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: ListView(
            children: [
              Container(
                height: 10.0,
              ),
              ListTile(
                title: Text("윤지인"),
              ),
              ListTile(
                title: Text("송다빈"),
              ),
              ListTile(
                title: Text("백지훈"),
              ),
              ListTile(
                title: Text("조형우"),
              ),
              ListTile(
                title: Text("맹주찬"),
              ),
              ListTile(
                title: Text("이오주"),
              ),
              Container(height: 10),
              _checkButton1(),
            ],
          )),
    );
  }

  Widget _checkButton1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 40.0),
        SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Delete()),
              );
            },
            child: Text(
              '친구 삭제',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFFFF5252)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              )),
            ),
          ),
        ),
        Container(width: 25.0),
        SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FriendRegister()),
              );
            },
            child: Text(
              '친구 추가',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff3A70AF)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              )),
            ),
          ),
        ),
      ],
    );
  }
}
