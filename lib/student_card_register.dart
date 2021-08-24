import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vacation_project/register_LAF.dart';
// import 'dart:html';
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vacation_project/lost_and_found.dart';
import 'package:vacation_project/student_card_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final FirebaseAuth _auth = FirebaseAuth.instance;
class RegisterSTcard extends StatefulWidget {
  const RegisterSTcard({Key key}) : super(key: key);

  @override
  State<RegisterSTcard> createState() => _RegisterSTcard();
}

class _RegisterSTcard extends State<RegisterSTcard> {
  final formattedDate = DateFormat('yyyy-MM-dd kk:mm:ss.ms').format(DateTime.now());
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final title = '학생증 습득 등록';
    return MaterialApp(
      title: title,
      home: Scaffold(
        resizeToAvoidBottomInset : false,
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
        body: ListView(
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
                  controller: myController1,
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
                  controller: myController2,
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
              ListTile(
                title: Text("습득장소",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextFormField(
                  // controller: myController2,
                  controller: myController3,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFF3A70AF), width: 2.0),
                    ),
                    hintText: '로뎀관',
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    border: OutlineInputBorder(),
                    labelText: '습득장소를 입력하세요.',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text("추가 정보",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                controller: myController4,
                decoration: const InputDecoration(
                  icon: Icon(Icons.info),
                  hintText: 'ex) 헬스장 신발장 위에 놔두었습니다. ',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
                  border: OutlineInputBorder(),
                  labelText: '추가정보를 입력하세요.',
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
            onPressed: () async  {

              var im_time = DateTime.now().microsecondsSinceEpoch;
              FirebaseFirestore.instance.collection('학생증').add({
            'get_place': myController3.text,
            'st_number': myController2.text,
            'st_name': myController1.text,
            'return_place': myController4.text,
            'type': '학생증',
            'timestamp': im_time,
            'time': formattedDate,
            'uptime' : formattedDate,
            'name': FirebaseAuth.instance.currentUser.displayName,
            'userId': FirebaseAuth.instance.currentUser.uid,
            });

                Navigator.pop(context);
              },
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
}     // 학생증 분실물 등록 화면
