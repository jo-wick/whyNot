import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  @override
  NoticeState createState() => NoticeState();
}

class NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항'),
        centerTitle: false,
        backgroundColor: Color(0xFF3A70AF),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(15.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35.0,
              ),
              Text(
                ' ✔︎   로그인 화면 구현 완료',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35.0,
              ),
              Text(
                ' ✔︎  시간표 화면 모두 구현 완료',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35.0,
              ),
              Text(
                ' ✔︎  bottom navigation bar 구현 완료',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35.0,
              ),
              Text(
                ' ✔︎  공지사항 구현 완료',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35.0,
              ),
              Text(
                ' ✔︎  분실물 화면 구현 중',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(20.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 35.0,
              ),
              Text(
                ' ✔︎  다크모드 구현 중',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
