import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_app1/calendar/Constants.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  Map<DateTime,List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map) {
    Map<String,dynamic> newMap = {};
    map.forEach((key,value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime,dynamic> decodeMap(Map<String,dynamic> map) {
    Map<DateTime,dynamic> newMap = {};
    map.forEach((key,value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              locale: 'ko_KR',
              events: _events,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.orange,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonVisible: false
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            Container(
              margin: EdgeInsets.only(left:10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: new Center(
                child: ListTile(
                  leading: Icon(Icons.add,color: Colors.white),
                  title: Text('일정 추가',style: TextStyle(color: Colors.white),),
                  onTap: _showAddDialog,
                ),
              ),
            ),
            ..._selectedEvents.map((event) =>
                ListTile(
                  key: UniqueKey(),
                  title: Text(event),
                  trailing: PopupMenuButton<String>(
                    onSelected: choiceAction,
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    }
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  void choiceAction(String choice) {
    if(choice == Constants.Modifying) {
      print('Modifying');
      _showModifyDialog();
    }
    if(choice == Constants.Delete) {
      print('Delete');
      _showremoveDialog();
    }

  }

  _showremoveDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            children: <Widget>[
              Text('삭제하시겠습니까?'),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("취소"),
              onPressed: (){
                setState(() {
                  _eventController.clear();
                  Navigator.pop(context);
                });
              },
            ),
            FlatButton(
              child: Text("확인"),
              onPressed: (){
                setState(() {
                  _events[_controller.selectedDay].remove(_eventController.text);
                  prefs.remove("dates");
                  _eventController.clear();
                  Navigator.pop(context);
                });
              },
            ),
          ],
        )
    );
  }

  _showModifyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('수정할 일정을 적어주세요'),
            TextField(
              controller: _eventController,
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("취소"),
            onPressed: (){
              setState(() {
                _eventController.clear();
                Navigator.pop(context);
              });
            },
          ),
          FlatButton(
            child: Text("수정"),
            onPressed: (){
              if(_eventController.text.isEmpty) return;
              setState(() {
                _eventController.clear();
                Navigator.pop(context);
              });
            },
          ),
        ],
      )
    );
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('일정을 적어주세요'),
              TextField(
                controller: _eventController,
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("취소"),
              onPressed: (){
                setState(() {
                  _eventController.clear();
                  Navigator.pop(context);
                });
              },
            ),
            FlatButton(
              child: Text("저장"),
              onPressed: (){
                if(_eventController.text.isEmpty) return;
                setState(() {
                  if(_events[_controller.selectedDay] != null) {
                    _events[_controller.selectedDay].add(_eventController.text);
                  }else{
                    _events[_controller.selectedDay] = [_eventController.text];
                  }
                  prefs.setString("events", json.encode(encodeMap(_events)));
                  _eventController.clear();
                  Navigator.pop(context);
                });
              },
            ),
          ],
        )
    );
  }
}