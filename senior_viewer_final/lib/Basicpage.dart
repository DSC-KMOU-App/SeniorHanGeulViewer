import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seniorviewerfinal/page1.dart';
import 'package:seniorviewerfinal/page2.dart';

class BasicPage extends StatefulWidget {
  BasicPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  int _currentindex = 0;
  final List<Widget> _screen = [Page1(),Page2()];
  void _onTap(int index){
    setState(() {
      _currentindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Senior Viewer"),
        ),
        body: _screen[_currentindex],
        bottomNavigationBar: new BottomNavigationBar(
            elevation: 0.0,
            onTap: _onTap,
            currentIndex: _currentindex,
            items: [
              new BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('홈 화면'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.wb_sunny),
                  title: Text('날씨'),
              ),
          ]
        )
    );
  }
}