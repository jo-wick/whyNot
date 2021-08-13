import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Color(0xFF3A70AF),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "등록",
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Registerlostandfound()),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text("분실물 종류",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6.5),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('학생증', style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 260,
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6.5),
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text('카드', style: TextStyle(fontSize: 17)),
                      SizedBox(
                        width: 280,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.arrow_forward_ios)),
                    ],
                  )),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6.5),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('지갑', style: TextStyle(fontSize:17)),
                    SizedBox(
                      width: 280,
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6.5),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('전자기기', style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 240,
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6.5),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('가방', style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 280,
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6.5),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('기타', style: TextStyle(fontSize: 17)),
                    SizedBox(
                      width: 280,
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class Registerlostandfound extends StatefulWidget {
  const Registerlostandfound({Key key}) : super(key: key);

  @override
  State<Registerlostandfound> createState() => _Registerlostandfound();
}

class _Registerlostandfound extends State<Registerlostandfound> {
  String _character = '';
  final myController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final title = '분실 등록';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children:  <Widget>[
              ListTile(
                title: Text("만약 학생증이라면 여기를 클릭해주세요",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(150,0,150,0),
                width: 120,
                height: 40,
                child: ElevatedButton(
                  child: Text(
                    '학생증',
                    style: TextStyle(
                      fontSize: 18,
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
                    MaterialStateProperty.all<Color>(Color(0xFF3A70AF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                  ),
                ),
              ),
              ListTile(
                title: Text("분실물 종류",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
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
                title: Text("습득장소",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                controller: myController1,
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_on),
                  hintText: 'ex) 비전 헬스장',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                  border: OutlineInputBorder(),
                  labelText: '습득한 장소를 입력하세요.',
                ),
              ),
              ListTile(
                title: Text("추가정보",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.info),
                  hintText: 'ex) 헬스장 신발장 위에 놔두었습니다. ',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                  border: OutlineInputBorder(),
                  labelText: '추가정보를 입력하세요.',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(150,0,150,0),
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '등록',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF3A70AF)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}


class RegisterSTcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = '학생증 분실 등록';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text("이름",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              // controller: myController1,
              decoration: const InputDecoration(
                hintText: 'ex) 백지훈',
                contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                border: OutlineInputBorder(),
                labelText: '이름을 입력하세요.',
              ),
            ),
            ListTile(
              title: Text("학번",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            TextFormField(
              // controller: myController2,
              decoration: const InputDecoration(
                hintText: 'ex) 22100344',
                contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                border: OutlineInputBorder(),
                labelText: '학번을 입력하세요.',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 120,
              height: 40,
              child: ElevatedButton(
                // onPressed: () {
                //
                // },
                child: Text(
                  '등록',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3A70AF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
