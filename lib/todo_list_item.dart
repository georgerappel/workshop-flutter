import 'package:flutter/material.dart';
import 'package:workshop/todo_controller.dart';
import 'package:workshop/todo_model.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final bool dismissible;

  TodoListItem(this.todo, {@required this.dismissible});

  @override
  Widget build(BuildContext context) {
    Widget _listContent = Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.work, color: todo.color, size: 24),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              todo.name,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );

    if (!dismissible) return _listContent;

    return Dismissible(
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16),
        child: Icon(Icons.check, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.startToEnd) {
          TodoController.completeTodo(todo);
        } else {
          TodoController.deleteTodo(todo);
        }
      },
      key: ValueKey(todo.id),
      child: _listContent,
    );
  }
}
