import 'package:flutter/material.dart';
import 'package:vacation_project/setting.dart';
import 'package:vacation_project/timetable_home.dart';

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);
class TimetableRegister extends StatefulWidget {
  @override
  TimetableRegisterState createState() => TimetableRegisterState();
}

class TimetableRegisterState extends State<TimetableRegister> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아니 이거 왜 안돼',
      theme: theme ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('시간표 등록'),
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => TimetableHome()
                ),
              );
            },
            icon: Icon(Icons.arrow_back)
          ),
        ),
        body: ListView(
          children: [
            Container(height: 10.0,),
            ListTile(
              title: Text("실전프로젝트"),
              onTap: () {
                // 시간표 등록
              },
            ),
            ListTile(
              title: Text("컴퓨터 구조"),
            ),
            ListTile(
              title: Text("이산 수학"),
            ),
            ListTile(
              title: Text("웹 서비스 개발"),
            ),
            ListTile(
              title: Text("환경과 인간"),
            ),
            ListTile(
              title: Text("경영학입문"),
            ),
            ListTile(
              title: Text("독일어 1"),
            ),
            ListTile(
              title: Text("물리학 실험 1"),
            ),
            ListTile(
              title: Text("미분 방정식과 응용"),
            ),
            ListTile(
              title: Text("물리학 1"),
            ),
            ListTile(
              title: Text("일반생물학"),
            ),
            ListTile(
              title: Text("선형대수학"),
            ),
            ListTile(
              title: Text("Calculus 1"),
            ),
            ListTile(
              title: Text("Calculus 2"),
            ),
            ListTile(
              title: Text("Calculus 3"),
            ),
            ListTile(
              title: Text("채플"),
            ),
            ListTile(
              title: Text("팀모임"),
            ),
          ],
        )
      ),
    );
  }
}
