import 'package:flutter/material.dart';
import 'package:minicurso/app_provider.dart';
import 'package:minicurso/todo.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  final form = GlobalKey<FormState>();
  Todo todo = Todo();

  void createTask(BuildContext context) {
    form.currentState.save();
    if (form.currentState.validate()) {
      context.read<AppProvider>().addTask(todo);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar tarefa"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: form,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) =>
                    value.length < 4 ? "Numero minimo de caracteres é 4" : null,
                decoration: InputDecoration(
                  labelText: "Nome da tarefa",
                  icon: Icon(Icons.menu),
                ),
                onSaved: (value) => todo.title = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createTask(context),
        child: Icon(Icons.done),
      ),
    );
  }
}
