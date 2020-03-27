import 'package:flutter/material.dart';
import 'package:flutter_app1/memo/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app1/memo/models/task_data.dart';

class todolist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
