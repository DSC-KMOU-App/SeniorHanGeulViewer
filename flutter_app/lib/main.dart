import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  Widget build(BuildContext context) {
   //var url = "";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
          ),
        ],
      ),

      body: new Center(
      child: new ListView(
        children: <Widget>[
          ListTile(leading:Icon(Icons.call),title: Text('전화')),
          ListTile(leading:Icon(Icons.book),title: Text('전화번호부')),
          ListTile(leading:IconButton(
            iconSize: 50.0,
            icon:Icon(Icons.call,color: Colors.lightBlue[300]),
            onPressed: () {},
          ),
          title: Text('전화'),),
          ListTile(leading:IconButton(
            iconSize: 50.0,
            icon:Icon(Icons.message,color: Colors.deepOrange[300]),
            onPressed:() {},
          ),
            title: Text('문자'),),
          ListTile(leading:IconButton(
            iconSize: 50.0,
            icon:Icon(Icons.photo_camera,color: Colors.lightBlue[200]),
            onPressed: () {},
          ),
              title:Text('카메라'))
        ]
      ),
      )
      ,
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
        ),
      ),
      );
  }
}