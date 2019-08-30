import 'package:flutter/material.dart';
import 'package:workshop/home_screen.dart';
import 'package:workshop/todo_create_screen.dart';
import 'package:workshop/todo_done_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0x17, 0x3f, 0x5f),
      ),
      home: MyHomePage(),
      routes: {
        '/new-todo': (context) => TodoCreateScreen(),
        '/todo-done': (context) => TodoDoneScreen(),
      },
    );
  }
}
