import 'package:flutter/material.dart';
import 'package:workshop/todo_controller.dart';
import 'package:workshop/todo_model.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;

  TodoListItem(this.todo);

  Widget _simpleItemContent() {
    return ListTile(
      leading: Icon(Icons.work, color: todo.color, size: 24),
      title: Text(todo.name),
      trailing: todo.done
          ? Icon(
              Icons.check,
              color: Colors.green,
            )
          : null,
    );
  }

  // Widget _simpleItemContent() {
  //   return Container(
  //     padding: EdgeInsets.all(16),
  //     child: Row(
  //       children: [
  //         Icon(Icons.work, color: todo.color, size: 24),
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             todo.name,
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
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
      direction:
          todo.done ? DismissDirection.endToStart : DismissDirection.horizontal,
      key: ValueKey(todo.id),
      child: _simpleItemContent(),
    );
  }
}
