import 'package:flutter/material.dart';
import 'package:flutter_app1/calendar/calendar.dart';
import 'package:flutter_app1/page 1.dart';
import 'package:flutter_app1/clock/clock.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page2',
      home: Page2StatefulWidget(),
    );
  }
}

class Page2StatefulWidget extends StatefulWidget {
  @override
  _Page2StatefulWidgetState createState() => _Page2StatefulWidgetState();
}

class _Page2StatefulWidgetState extends State<Page2StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Clock(),
          Container(
            height: 350,
            child: Calendar(),
          ),
          RaisedButton(
            child: Text('이전 페이지'),
            onPressed: () async {
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Page1()));
            },
          ),
        ],
      ),
    );
  }
}