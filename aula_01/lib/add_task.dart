import 'package:flutter/material.dart';
import 'package:minicurso/todo.dart';

class AddTask extends StatelessWidget {
  AddTask(this.function);

  final Function function;
  final form = GlobalKey<FormState>();
  Todo todo = Todo();

  void createTask(BuildContext context) {
    form.currentState.save();
    if (form.currentState.validate()) {
      function(todo);
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
