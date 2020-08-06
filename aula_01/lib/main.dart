import 'package:flutter/material.dart';
import 'package:minicurso/home.dart';

void main() {
  runApp(MinicursoApp());
}

class MinicursoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
