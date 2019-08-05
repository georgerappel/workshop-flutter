import 'package:flutter/material.dart';
import 'package:workshop/home_screen.dart';
import 'package:workshop/todo_create_screen.dart';
import 'package:workshop/todo_done_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
