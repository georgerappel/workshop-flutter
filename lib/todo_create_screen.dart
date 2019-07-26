import 'package:flutter/material.dart';
import 'package:workshop/todo_controller.dart';
import 'package:workshop/todo_model.dart';

class TodoCreateScreen extends StatefulWidget {
  @override
  _TodoCreateScreenState createState() => _TodoCreateScreenState();
}

class _TodoCreateScreenState extends State<TodoCreateScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Todo todo = Todo();

  _onSave() {
    if (!_formKey.currentState.validate()) {
      //erro de validação
      return;
    }

    _formKey.currentState.save();

    TodoController.addTodo(todo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New To-do"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _onSave,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                labelText: "Nome",
                icon: Icon(Icons.list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              autovalidate: false,
              validator: (val) => val.isEmpty ? "Campo obrigatório" : null,
              onSaved: (val) => todo.name = val,
            ),
            DropdownButtonFormField(
              value: todo.color,
              hint: Text("Escolha uma cor"),
              decoration: InputDecoration(icon: Icon(Icons.color_lens)),
              items: List<DropdownMenuItem<Color>>.generate(
                TodoController.todoColors.length,
                (index) {
                  return DropdownMenuItem<Color>(
                    value: TodoController.todoColors[index],
                    key: ValueKey(index),
                    child: Icon(
                      Icons.work,
                      color: TodoController.todoColors[index],
                    ),
                  );
                },
              ),
              validator: (val) => val == null ? "Campo obrigatório" : null,
              onChanged: (val) {
                setState(() {
                  todo.color = val;
                });
              },
              onSaved: (val) => todo.color = val,
            ),
          ],
        ),
      ),
    );
  }
}
