import 'package:flutter/material.dart';
import 'package:vacation_project/lost_and_found.dart';
import 'package:vacation_project/setting.dart';
import 'package:vacation_project/student_card_register.dart';

class Registerlostandfound extends StatefulWidget {
  const Registerlostandfound({Key key}) : super(key: key);

  @override
  State<Registerlostandfound> createState() => _Registerlostandfound();
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);
class _Registerlostandfound extends State<Registerlostandfound> {
  String _character = '';
  final myController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final title = '습득물 등록';
    return MaterialApp(
      title: title,
      theme: theme ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => LostandFound()),
                );
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: ListView(
          //child: Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 13.0),
          children: <Widget>[
            Container(height: 20),
            _text1(),
            Container(height: 15),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  '학생증',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RegisterSTcard()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue[300]),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  )),
                ),
              ),
            ),
            ListTile(
              title: Text("습득물 종류",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            RadioListTile(
              title: const Text('카드'),
              value: '카드',
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('지갑'),
              value: '지갑',
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('전자기기'),
              value: '전자기기',
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('가방'),
              value: '가방',
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value.toString();
                });
              },
            ),
            RadioListTile(
              title: const Text('기타'),
              value: '기타',
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value.toString();
                });
              },
            ),
            ListTile(
              title: Text("습득 장소",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              controller: myController1,
              decoration: const InputDecoration(
                icon: Icon(Icons.location_on),
                hintText: 'ex) 비전 헬스장',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                border: OutlineInputBorder(),
                labelText: '습득한 장소를 입력하세요.',
              ),
            ),
            ListTile(
              title: Text("추가 정보",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            TextFormField(
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
            Container(height: 20),
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
          '만약 학생증이라면 여기를 클릭해주세요.',
          style: TextStyle(
            fontSize: 16,
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
        Container(width: 195.0),
        SizedBox(
          width: 80,
          height: 35,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => LostandFound()),
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
