import 'package:flutter/material.dart';
import 'package:vacation_project/register_LAF.dart';
import 'package:vacation_project/student_card_register.dart';

import 'lost_and_found_board.dart';

class LostandFound extends StatefulWidget {
  @override
  LostandFoundState createState() => LostandFoundState();
}

class LostandFoundState extends State<LostandFound> {
  @override
  Widget build(BuildContext context) {
    final title = '분실물';
    return MaterialApp(
      title: '아니 이거 왜 안돼',
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text("Lost and Found",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add,
                  color: Colors.grey[850],
                ),
                title: Text("습득물 등록"),
                onTap: () {
                  // Listtile 자체의 ontap
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Registerlostandfound()),
                  );
                },
                //trailing: Icon(Icons.add),
              ),
              ListTile(
                leading: Icon(
                  Icons.add,
                  color: Colors.grey[850],
                ),
                title: Text("학생증 습득 등록"),
                onTap: () {
                  // Listtile 자체의 ontap
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterSTcard()),
                  );
                },
                //trailing: Icon(Icons.add),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Color(0xFF3A70AF),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text("분실물 종류를 선택해주세요.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('학생증', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 259,
                    ),
                    IconButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lost_found_stcard_board_Page(types: '학생증')),
                          );
                        }, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text('카드', style: TextStyle(fontSize: 16)),
                      SizedBox(
                        width: 273,
                      ),
                      IconButton(
                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lost_found_board_Page(types: '카드')),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_ios)),
                    ],
                  )),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('지갑', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 273,
                    ),
                    IconButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lost_found_board_Page(types: '지갑')),
                          );
                        }, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('전자기기', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 243,
                    ),
                    IconButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lost_found_board_Page(types: '전자기기')),
                          );
                        }, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('가방', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 273,
                    ),
                    IconButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lost_found_board_Page(types: '가방')),
                          );
                        }, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('기타', style: TextStyle(fontSize: 16)),
                    SizedBox(
                      width: 273,
                    ),
                    IconButton(
                        onPressed: () {

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Lost_found_board_Page(types: '기타')),
                          );
                        }, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}     // 분실물 종류 선택 화면
