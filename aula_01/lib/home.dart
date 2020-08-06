import 'package:flutter/material.dart';
import 'package:minicurso/add_task.dart';
import 'package:minicurso/home_body.dart';
import 'package:minicurso/todo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todo = [];

  void openAddTaskScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => AddTask(addTask)));
  }

  void addTask(Todo task) {
    setState(() {
      todo.add(task);
    });
  }

  void setAsDone(int i) {
    setState(() {
      todo.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minicurso"),
      ),
      body: HomeBody(todo, setAsDone),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddTaskScreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
