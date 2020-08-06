import 'package:flutter/material.dart';
import 'package:minicurso/todo.dart';

class HomeBody extends StatefulWidget {
  HomeBody(this.todo, this.setAsDone);

  final List<Todo> todo;
  final Function setAsDone;

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: widget.todo.isEmpty
            ? Center(
                child: Text("Não há tarefas"),
              )
            : ListView.separated(
                itemCount: widget.todo.length,
                separatorBuilder: (_, i) => Divider(),
                itemBuilder: (_, int i) {
                  return ListTile(
                    title: Text(widget.todo[i].title),
                    trailing: IconButton(
                      icon: Icon(Icons.done),
                      onPressed: () => widget.setAsDone(i),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
