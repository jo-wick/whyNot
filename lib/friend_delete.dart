import 'package:flutter/material.dart';
import 'package:vacation_project/timetable_home.dart';

class Delete extends StatefulWidget {
  @override
  DeleteState createState() => DeleteState();
}

class DeleteState extends State<Delete> {
  List<Map> names = [
    {"name": "송다빈", "isChecked": false},
    {"name": "윤지인", "isChecked": false},
    {"name": "백지훈", "isChecked": false},
    {"name": "조형우", "isChecked": false},
    {"name": "맹주찬", "isChecked": false},
    {"name": "이오주", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('친구 삭제'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _text1(),
            SizedBox(height: 10),
            Column(
                children: names.map((name) {
              return CheckboxListTile(
                  value: name["isChecked"],
                  title: Text(name["name"]),
                  onChanged: (newValue) {
                    setState(() {
                      name["isChecked"] = newValue;
                    });
                  });
            }).toList()),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            Wrap(
              children: names.map((name) {
                if (name["isChecked"] == true) {
                  return Card(
                    elevation: 3,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(name["name"]),
                    ),
                  );
                }
                return Container();
              }).toList(),
            ),
            Container(height: 20),
            _checkButton(),
          ]),
        ),
      ),
    );
  }

  Widget _text1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(width: 18),
        Text(
          '삭제할 친구를 선택하세요.',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _checkButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(width: 180.0),
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
                  return AlertDialog(content: Text("Successfully deleted."));
                }),
            child: Text(
              '삭제',
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
}     // 친구 삭제 화면
