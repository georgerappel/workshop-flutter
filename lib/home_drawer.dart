import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Container(),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Tarefas a fazer"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                ListTile(
                  leading: Icon(Icons.done),
                  title: Text("Tarefas feitas"),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/todo-done');
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
