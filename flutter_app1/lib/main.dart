import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/Basic Page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicPage(title: 'Senior Viewer'),
    );
  }
}