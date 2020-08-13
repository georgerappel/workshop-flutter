import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:minicurso/add_task.dart';
import 'package:minicurso/todo.dart';

class AppProvider with ChangeNotifier {
  AppProvider() {
    getPreferences();
  }

  bool dark = false;
  List<Todo> todo = [];

  void openAddTaskScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddTask()));
  }

  void toggleDarkMode() async {
    dark = !dark;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("dark", dark);
    notifyListeners();
  }

  void addTask(Todo task) async {
    todo.add(task);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("todo", todo.map((e) => e.title).toList());
    notifyListeners();
  }

  void setAsDone(int i) async {
    todo.removeAt(i);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("todo", todo.map((e) => e.title).toList());
    notifyListeners();
  }

  void getPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dark = preferences.getBool("dark") ?? false;
    todo = preferences
            .getStringList("todo")
            ?.map((e) => Todo(title: e))
            ?.toList() ??
        [];
    notifyListeners();
  }
}
