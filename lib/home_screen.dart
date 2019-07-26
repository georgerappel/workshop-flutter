import 'package:flutter/material.dart';
import 'package:workshop/todo_controller.dart';
import 'package:workshop/todo_list_item.dart';
import 'package:workshop/todo_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Container(),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Tarefas a fazer"),
                      onTap: () {}),
                  ListTile(
                    leading: Icon(Icons.done),
                    title: Text("Tarefas feitas"),
                    onTap: () => Navigator.of(context).pushNamed('/todo-done'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: TodoController.todoList().length,
          itemBuilder: (context, index) {
            return TodoListItem(
              TodoController.todoList()[index],
              dismissible: true,
            );
          },
        ),
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
