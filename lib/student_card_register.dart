import 'package:flutter/material.dart';
import 'package:vacation_project/register_LAF.dart';

class RegisterSTcard extends StatefulWidget {
  const RegisterSTcard({Key key}) : super(key: key);

  @override
  State<RegisterSTcard> createState() => _RegisterSTcard();
}

class _RegisterSTcard extends State<RegisterSTcard> {
  @override
  Widget build(BuildContext context) {
    final title = '학생증 습득 등록';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Registerlostandfound()),
                );
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(title),
          backgroundColor: Color(0xFF3A70AF),
        ),
        body: Column(
          children: <Widget>[
            Container(height: 20),
            _text1(),
            ListTile(
              title: Text("이름",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                // controller: myController1,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF3A70AF), width: 2.0),
                  ),
                  hintText: 'ex) 백지훈',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  border: OutlineInputBorder(),
                  labelText: '이름을 입력하세요.',
                ),
              ),
            ),
            ListTile(
              title: Text("학번",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: TextFormField(
                // controller: myController2,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF3A70AF), width: 2.0),
                  ),
                  hintText: 'ex) 22100123',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  border: OutlineInputBorder(),
                  labelText: '학번을 입력하세요.',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _checkButton(),
          ],
        ),
      ),
    );
  }

  Widget _text1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '습득한 학생증의 이름과 학번을 입력해주세요.',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _checkButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 205.0),
        SizedBox(
          width: 80,
          height: 35,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => Registerlostandfound()),
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
                  return AlertDialog(content: Text("Successfully registered."));
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
}
