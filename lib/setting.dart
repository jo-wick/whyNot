import 'package:flutter/material.dart';
import 'package:vacation_project/login_page.dart';
import 'notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '아니 이거 왜 안돼',
      home: Scaffold(
        appBar: AppBar(
          title: Text('설정'),
          centerTitle: true,
          backgroundColor: Color(0xFF3A70AF),
        ),
        body: Builder(builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(height: 30.0),
                  _text1(),
                  Container(height: 10.0),
                  Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFE5E5E5),
                    ),
                    child: _text11(),
                  ),
                  Container(height: 10.0),
                  Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFE5E5E5),
                    ),
                    child: _text21(),
                  ),
                  Container(height: 20.0),
                  _text2(),
                  Container(height: 10.0),
                  Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFE5E5E5),
                    ),
                    child: _text31(),
                  ),
                  Container(height: 250.0),
                  Container(
                    width: 300,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFFF5252),
                        borderRadius: BorderRadius.circular(30)),
                    child: _text41(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _text1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 25.0),
        Text(
          '서비스',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _text11() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 15.0),
        Text(
          '공지사항',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Container(width: 235.0),
        Flexible(
          child: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            iconSize: 25,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notice()),
              );
            },
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _text2() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 25.0),
        Text(
          '편리한 기능',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _text21() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 15.0),
        Text(
          '알림',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Container(width: 245.0),
        Switch(
          value: isSwitched1,
          onChanged: (value) {
            setState(() {
              isSwitched1 = value;
              print(isSwitched1);
            });
          },
          activeTrackColor: Color(0xFF3A70AF),
          activeColor: Colors.white,
        ),
      ],
    );
  }

  Widget _text31() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 15.0),
        Text(
          '다크모드',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Container(width: 215.0),
        Switch(
          value: isSwitched2,
          onChanged: (value) {
            setState(() {
              isSwitched2 = value;
              print(isSwitched2);
            });
          },
          activeTrackColor: Color(0xFF3A70AF),
          activeColor: Colors.white,
        ),
      ],
    );
  }

  Widget _text41() {
    return ElevatedButton(
      onPressed: () {
        signOut();
        Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(MaterialPageRoute(
            builder: (BuildContext context) =>
                LoginPage()), (route) => false);
      },
      child: Text(
        '로그아웃',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      style: ButtonStyle(
        backgroundColor:
        MaterialStateProperty.all<Color>(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            )),
      ),
    );
  }
  Future<void> signOut() async {
    await Firebase.initializeApp();

    try {
      await FirebaseAuth.instance.signOut();
      print("Success");
    } catch (e) {
      print(e.toString());
    }
  }
}
