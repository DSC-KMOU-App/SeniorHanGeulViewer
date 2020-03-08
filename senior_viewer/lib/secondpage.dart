import 'package:flutter/cupertino.dart';

import 'calendar/Calender.dart';
import 'clock/Clock.dart';

// ignore: camel_case_types
class secondpage extends StatelessWidget{
  Widget build(BuildContext context){
    return Center(
      child:  Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Clock(),
          Container(
            height: 350,
            child: Calendar(),
          ),
        ],
      ),
    );
  }
}
