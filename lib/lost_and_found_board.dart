
import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vacation_project/lost_and_found.dart';
import 'package:vacation_project/setting.dart';
import 'package:vacation_project/student_card_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);


class Lost_found_board_Page extends StatefulWidget {
  final String types;
  Lost_found_board_Page({@required this.types});
  @override
  _Lost_found_board_Page createState() => _Lost_found_board_Page(types: types);
}


class _Lost_found_board_Page extends State<Lost_found_board_Page>{

  String types;
  _Lost_found_board_Page({this.types});
  bool line = true;
  String day = "";

  @override
  Widget build(BuildContext context) {
    final title = types + ' 습득물';
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
        body: StreamBuilder(
          stream:
          FirebaseFirestore.instance
              .collection(types)
          // .where('type', isEqualTo: '카드')
              .orderBy('timestamp', descending: line)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 1,
                    padding: EdgeInsets.all(16.0),
                    childAspectRatio: 3.5 / 2.8,
                    children: snapshot.data.docs.map((document) {
                      day = document['time'];
                      day = day.substring(5,16);
                      return
                        Card(
                          clipBehavior: Clip.antiAlias,
                          // TODO: Adjust card heights (103)
                          child: Column(
                            // TODO: Center items on the card (103)
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              AspectRatio(
                                  aspectRatio: 2 / 1,
                                  child: Image.network(document['downloadURL'], fit: BoxFit.none)
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          "습득 장소: "+document['get_place'] + "     등록날짜: " + day
                                      ),
                                      SizedBox(height: 8.0),
                                      InkWell(
                                        child: Text('more', style: TextStyle(fontSize: 13.0, color: Colors.blue)),
                                        onTap: () {

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Lost_found_detail_Page(product: document)),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                    }).toList(),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
class Lost_found_stcard_board_Page extends StatefulWidget {
  final String types;
  Lost_found_stcard_board_Page({@required this.types});
  @override
  _Lost_found_stcard_board_Page createState() => _Lost_found_stcard_board_Page(types: types);
}


class _Lost_found_stcard_board_Page extends State<Lost_found_stcard_board_Page>{

  String types;
  _Lost_found_stcard_board_Page({this.types});
  bool line = true;
  String day = "";

  @override
  Widget build(BuildContext context) {
    final title = types + ' 습득물';
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
        body: StreamBuilder(
          stream:
          FirebaseFirestore.instance
              .collection(types)
          // .where('type', isEqualTo: '카드')
              .orderBy('timestamp', descending: line)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: <Widget>[
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 1,
                    padding: EdgeInsets.all(16.0),
                    childAspectRatio: 1 / 0.2,
                    children: snapshot.data.docs.map((document) {
                      day = document['time'];
                      day = day.substring(5,16);
                      return
                        Card(
                          clipBehavior: Clip.antiAlias,
                          // TODO: Adjust card heights (103)
                          child: Column(
                            // TODO: Center items on the card (103)
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          "습득 장소: "+document['get_place'] + "     등록날짜: " + day
                                      ),
                                      SizedBox(height: 8.0),
                                      InkWell(
                                        child: Text('more', style: TextStyle(fontSize: 13.0, color: Colors.blue)),
                                        onTap: () {

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Lost_found_stcard_detail_Page(product: document)),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                    }).toList(),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
class Lost_found_detail_Page extends StatefulWidget {
  final QueryDocumentSnapshot<Object> product;
  Lost_found_detail_Page({@required this.product});
  @override
  _Lost_found_detail_Page createState() => _Lost_found_detail_Page(product: product);
}

class _Lost_found_detail_Page  extends State<Lost_found_detail_Page>{

  QueryDocumentSnapshot<Object> product;
  _Lost_found_detail_Page({this.product});

  @override
  Widget build(BuildContext context) {

    String day = "";
    day = product['time'];
    day = day.substring(5,16);
    final title = '습득물';
    return MaterialApp(
      title: title,
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
          actions: [
            IconButton(icon: Icon(Icons.delete), onPressed: (){
              User userId = FirebaseAuth.instance.currentUser;
              String user_id = userId.uid;
              if (user_id == product['userId']){
                deleteDoc(product['type'], product['timestamp']);

                Navigator.pop(context);
              }
            }),
          ],
        ),
        body:Column(
              children: <Widget>[
                Expanded(child: Image.network(
                product['downloadURL'], fit: BoxFit.none)),

                Text(
                    "작성자: "+product['name']
                ),
                Text(
                    "등록날짜: " + day
                ),
                Text(
                    "습득장소: "+product['get_place']
                ),
                Text(
                    "추가정보: "+product['return_place']
                ),


              ],
            )
      )
    );
  }
  void deleteDoc(String collect, int time){
    FirebaseFirestore.instance
        .collection(collect)
        .where("timestamp", isEqualTo : time)
        .get().then((value){
      value.docs.forEach((element) {
        print("${element.id}");
        FirebaseFirestore.instance.collection(collect).doc(element.id).delete();
      });
    });

  }
}

class Lost_found_stcard_detail_Page extends StatefulWidget {
  final QueryDocumentSnapshot<Object> product;
  Lost_found_stcard_detail_Page({@required this.product});
  @override
  _Lost_found_stcard_detail_Page createState() => _Lost_found_stcard_detail_Page(product: product);
}

class _Lost_found_stcard_detail_Page  extends State<Lost_found_stcard_detail_Page>{

  QueryDocumentSnapshot<Object> product;
  _Lost_found_stcard_detail_Page({this.product});

  @override
  Widget build(BuildContext context) {

    String day = "";
    day = product['time'];
    day = day.substring(5,16);
    final title = '습득물';
    return MaterialApp(
        title: title,
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
              actions: [
                IconButton(icon: Icon(Icons.delete), onPressed: (){
                  User userId = FirebaseAuth.instance.currentUser;
                  String user_id = userId.uid;
                  if (user_id == product['userId']){
                    deleteDoc(product['type'], product['timestamp']);

                    Navigator.pop(context);
                  }
                }),
              ],
            ),
            body:Column(
              children: <Widget>[

                Text(
                    "작성자: "+product['name']
                ),
                Text(
                    "등록날짜: " + day
                ),
                Text(
                    "습득장소: "+product['get_place']
                ),
                Text(
                    "학생증 이름: "+product['st_name']
                ),
                Text(
                    "학번: "+product['st_number']
                ),
                Text(
                    "추가정보: "+product['return_place']
                ),


              ],
            )
        )
    );
  }
  void deleteDoc(String collect, int time){
    FirebaseFirestore.instance
        .collection(collect)
        .where("timestamp", isEqualTo : time)
        .get().then((value){
      value.docs.forEach((element) {
        print("${element.id}");
        FirebaseFirestore.instance.collection(collect).doc(element.id).delete();
      });
    });

  }
}
