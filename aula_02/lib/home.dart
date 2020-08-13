import 'package:flutter/material.dart';
import 'package:minicurso/app_provider.dart';
import 'package:minicurso/home_body.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Minicurso"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () => provider.toggleDarkMode(),
          ),
        ],
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.openAddTaskScreen(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
