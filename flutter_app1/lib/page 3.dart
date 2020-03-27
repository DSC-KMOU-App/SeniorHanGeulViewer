import 'package:flutter/material.dart';
import 'package:flutter_app1/memo/memo.dart';
import 'package:flutter_app1/page 1.dart';
import 'package:flutter_app1/page 2.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SeniorHanguelViewer',
      home: Page3StatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Page3StatefulWidget extends StatefulWidget {
  @override
  _Page3StatefulWidgetState createState() => _Page3StatefulWidgetState();
}

class _Page3StatefulWidgetState extends State<Page3StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: todolist(),
        bottomNavigationBar: BottomAppBar(
            elevation: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                    onPressed: () async {
                      await Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Page2()));
                      },
                    child: Text(
                        '이전 화면',
                        style: TextStyle(color: Colors.black, fontSize: 25)
                    )
                ),
                FlatButton(
                    onPressed: () async {
                      await Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Page1()));
                      },
                    child: Text(
                        '다음 화면',
                        style: TextStyle(color: Colors.black, fontSize: 25)
                    )
                ),
              ],
            )
        )
    );
  }
}