import 'package:flutter/material.dart';
import 'package:minicurso/app_provider.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Container(
        child: provider.todo.isEmpty
            ? Center(
                child: Text("Não há tarefas"),
              )
            : ListView.separated(
                itemCount: provider.todo.length,
                separatorBuilder: (_, i) => Divider(),
                itemBuilder: (_, int i) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      provider.setAsDone(i);
                    },
                    background: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    confirmDismiss: (direction) {
                      return showDialog<bool>(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              content: Text(
                                  "Você tem certeza que deseja remover esta tarefa?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text("Não"),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                    provider.setAsDone(i);
                                  },
                                  child: Text("Sim"),
                                ),
                              ],
                            );
                          });
                    },
                    child: ListTile(
                      title: Text(provider.todo[i].title),
                      trailing: IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () => provider.setAsDone(i),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
