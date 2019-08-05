import 'package:flutter/material.dart';
import 'package:workshop/home_drawer.dart';
import 'package:workshop/todo_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _createTodo() {
    Navigator.of(context).pushNamed('/new-todo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      drawer: HomeDrawer(),
      body: Center(
        child: TodoList(done: false),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createTodo,
        backgroundColor: Color.fromARGB(255, 0x17, 0x3f, 0x5f),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
