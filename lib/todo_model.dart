import 'package:flutter/cupertino.dart';

class Todo {
  String id;
  String name;
  Color color;
  bool done;

  Todo({this.name, this.color, this.done = false}) {
    this.id = DateTime.now().toIso8601String();
  }
}
