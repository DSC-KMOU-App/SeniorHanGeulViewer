import 'package:flutter/material.dart';
import 'package:flutter_app1/page 2.dart';

class Page1 extends StatelessWidget {
  static const String _title = 'SeniorHanguelViewer';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Page1StatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Page1StatefulWidget extends StatefulWidget {
  Page1StatefulWidget({Key key}) : super(key: key);

  @override
  _Page1StatefulWidgetState createState() => _Page1StatefulWidgetState();
}

class _Page1StatefulWidgetState extends State<Page1StatefulWidget> {
  void updateState() {
    print("Update State of FirstPage");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        left: true,
        right: true,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('images/call2.png'),
                      onPressed: (){
                        print('call');
                      },
                      iconSize: 130.0,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    IconButton(
                      icon: Image.asset('images/message2.png'),
                      onPressed: (){
                        print('message');
                      },
                      iconSize: 130.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('images/kakao2.png'),
                      onPressed: (){
                        print('kakao');
                      },
                      iconSize: 130.0,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    IconButton(
                      icon: Image.asset('images/contact2.png'),
                      onPressed: (){
                        print('contact');
                      },
                      iconSize: 130.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('images/camera2.png'),
                      onPressed: (){
                        print('camera');
                      },
                      iconSize: 130.0,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    IconButton(
                      icon: Image.asset('images/gallery2.png'),
                      onPressed: (){
                        print('gallery');
                      },
                      iconSize: 130.0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('images/band2.png'),
                      onPressed: (){
                        print('band');
                      },
                      iconSize: 130.0,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    IconButton(
                      icon: Image.asset('images/next_page2.png'),
                      onPressed: () async {
                        await Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => Page2()));
                        updateState();
                        print('next page');
                        },
                      iconSize: 130.0,
                    ),
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}