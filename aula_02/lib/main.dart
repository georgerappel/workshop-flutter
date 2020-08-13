import 'package:flutter/material.dart';
import 'package:minicurso/app_provider.dart';
import 'package:minicurso/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MinicursoApp(),
    ),
  );
}

class MinicursoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode:
          context.watch<AppProvider>().dark ? ThemeMode.dark : ThemeMode.light,
      home: Home(),
    );
  }
}
