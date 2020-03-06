import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class firstpage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.call),
                onPressed: (){
                  print('call');
                },
                iconSize: 100.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              IconButton(
                icon: Icon(Icons.message),
                onPressed: (){
                  print('message');
                },
                iconSize: 100.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              IconButton(
                icon: Icon(Icons.book),
                onPressed: (){
                  print('book');
                },
                iconSize: 100.0,
              ),
            ],
          ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.wb_auto),
            onPressed: (){
              print('weather');
            },
            iconSize: 100.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          IconButton(
            icon: Icon(Icons.music_note),
            onPressed: (){
              print('music');
            },
            iconSize: 100.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          IconButton(
            icon: Icon(Icons.library_books),
            onPressed: (){
              print('band');
            },
            iconSize: 100.0,
          ),
        ],
      ),
        ]
      ),
    );
  }
}