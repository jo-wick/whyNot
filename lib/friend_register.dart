import 'package:flutter/material.dart';
import 'package:vacation_project/timetable_home.dart';

class FriendRegister extends StatefulWidget {
  @override
  FriendRegisterState createState() => FriendRegisterState();
}

class FriendRegisterState extends State<FriendRegister> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('친구 등록'),
          centerTitle: false,
          backgroundColor: Color(0xFF3A70AF),
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
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: ListTile(
                title: Text("등록할 친구의 인증코드를 입력하세요."),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: "인증코드",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF3A70AF), width: 2.0),
                  ),
                ),
              ),
            ),
            Container(height: 30.0),
            _checkButton(),
          ],
        ));
  }

  Widget _checkButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 210.0),
        SizedBox(
          width: 80,
          height: 35,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => TimetableHome()),
              );
            },
            child: Text(
              '취소',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              )),
            ),
          ),
        ),
        Container(width: 10.0),
        SizedBox(
          width: 80,
          height: 35,
          child: ElevatedButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Text(myController.text + " registered."));
                }),
            child: Text(
              '등록',
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
}     // 친구 등록 화면
