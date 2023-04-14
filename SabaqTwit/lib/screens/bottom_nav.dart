import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sabaqtwit/screens/account_screen.dart';
import 'package:sabaqtwit/screens/display_screen.dart';
import 'package:sabaqtwit/screens/home_screen.dart';
import 'package:sabaqtwit/screens/login_screen.dart';
import 'package:sabaqtwit/screens/create_tweet.dart';
import 'package:sabaqtwit/screens/new_display_upload_screen.dart';
import 'package:sabaqtwit/screens/new_upload_screen.dart';
import 'package:sabaqtwit/screens/news_page.dart';
import 'package:sabaqtwit/screens/not_screen.dart';
import 'package:sabaqtwit/screens/notification_screen.dart';
import 'package:sabaqtwit/screens/table.dart';
import 'package:sabaqtwit/screens/table_second.dart';
import 'package:sabaqtwit/screens/upload_files.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    NewsPage(),//const NotificationScreenOne(),
    const DisplayUpload(),
    CalendarPage(),
    const SecondTable(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Басты бет',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Хабарландыру',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'QR - код',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows),
            label: 'Күнтізбе',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Жеке кабинет',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
