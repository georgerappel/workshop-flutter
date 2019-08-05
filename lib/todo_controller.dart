import 'package:flutter/material.dart';
import 'package:workshop/todo_model.dart';

class TodoController {
  /// Our to-do "Database"
  static List<Todo> todos = [
    Todo(name: "Apresentação do workshop", color: todoColors[0]),
    Todo(name: "Tirar 10 em cálculo", color: todoColors[2]),
    Todo(name: "Mandar um email", color: todoColors[0]),
    Todo(name: "Apresentação do workshop", color: todoColors[1]),
    Todo(name: "Tirar 10 em cálculo", color: todoColors[1], done: true),
    Todo(name: "Mandar um email", color: todoColors[2]),
  ];

  /// Available colors for to-do items
  static List<Color> todoColors = [
    Color.fromARGB(255, 0x3c, 0xae, 0xa3),
    Color.fromARGB(255, 0xf6, 0xd5, 0x5c),
    Color.fromARGB(255, 0x20, 0x63, 0x9b),
  ];

  /// List of to-dos waiting for completion
  static List<Todo> todoList() {
    return todos.where((Todo todo) => !todo.done).toList();
  }

  /// List of to-dos waiting for completion
  static List<Todo> doneList() {
    return todos.where((Todo todo) => todo.done).toList();
  }

  static void deleteTodo(Todo todo) {
    todos.removeWhere((t) => t.id == todo.id);
  }

  static void updateTodo(Todo todo) {
    int index = todos.indexWhere((t) => t.id == todo.id);
    if (index > -1) {
      // Update only if the item was found
      todos[index] = todo;
    }
  }

  static void completeTodo(Todo todo) {
    todo.done = true;
    updateTodo(todo);
  }

  static void addTodo(Todo todo) {
    todos.add(todo);
  }
}
