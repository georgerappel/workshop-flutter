import 'package:flutter/material.dart';

class TodoDoneScreen extends StatefulWidget {
  @override
  _TodoDoneScreenState createState() => _TodoDoneScreenState();
}

class _TodoDoneScreenState extends State<TodoDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas finalizadas"),
      ),
      body: Center(
        child: Container(
          child: Text("Tudo feito"),
        ),
      ),
    );
  }
}
