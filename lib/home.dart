import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:vacation_project/lost_and_found.dart';
import 'package:vacation_project/provider/bottom_navigation_provider.dart';
import 'package:vacation_project/timetable.dart';
import 'timetable_home.dart';
import 'login_page.dart';
import 'setting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;

  Widget _navigationBody() {
    switch (_selectedIndex) {
      case 0: // Home
        return MaterialApp(home: new TimetableHome());
        break;
      case 1: // Timetable
        return MaterialApp(home: new Timetable2());
        break;
      case 2: // LostAndFound
        return MaterialApp(home: new LostandFound());
        break;
      case 3: // Settings
        return MaterialApp(home: new Setting());
        break;
    }
    return Container();
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "시간표"),
        BottomNavigationBarItem(icon: Icon(Icons.umbrella), label: "분실물"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정"),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFF3A70AF),
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigationBody(),
      bottomNavigationBar: _bottomNavigationBarWidget(),
    );
  }
}     // 홈 화면
