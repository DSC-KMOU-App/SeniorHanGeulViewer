import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app1/page 1.dart';

class BasicPage extends StatefulWidget {
  BasicPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _BasicPageState createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      body: Page1(),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: FlatButton(
            onPressed: (){exit(0);},
            child: Text(
                '종료',
            style: TextStyle(color: Colors.black, fontSize: 25)
            )
        )
      )
    );
  }
}
