import 'package:flutter/material.dart';
import 'package:workshop/todo_controller.dart';
import 'package:workshop/todo_list_item.dart';
import 'package:workshop/todo_model.dart';

class TodoList extends StatelessWidget {
  /// Status dos elementos que já estão concluídos
  /// Se for true, lista apenas elementos concluidos.
  /// Se for false, lista apenas elementos não concluídos.
  final bool done;
  List<Todo> todos; // Gera um erro de campo marcado como imutável, mas funciona

  TodoList({@required this.done}) {
    if (done) {
      todos = TodoController.doneList();
    } else {
      todos = TodoController.todoList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoListItem(todos[index]);
      },
    );
  }
}

/// * OPÇÃO COM STATEFUL WIDGET * ///
/// A opção abaixo é um stateful widget pra todo list, mas tem uma gambiarra
/// não recomendada no método build pra evitar erros com o Dismissible, quando
/// o usuário conclui ou exclui um item. O modo certo seria usando ScopedModel
/// ou algum padrão pra gerenciar os estados do app e atualizar sempre a lista
/// de TODOs no build.

// class TodoList extends StatefulWidget {
//   /// Status dos elementos que já estão concluídos
//   /// Se for true, lista apenas elementos concluidos.
//   /// Se for false, lista apenas elementos não concluídos.
//   final bool done;

//   TodoList({@required this.done});

//   @override
//   _TodoListState createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   List<Todo> todos;

//   @override
//   Widget build(BuildContext context) {
//
//     if (widget.done) {
//       todos = TodoController.doneList();
//     } else {
//       todos = TodoController.todoList();
//     }

//     return ListView.builder(
//       itemCount: todos.length,
//       itemBuilder: (context, index) {
//         return TodoListItem(todos[index]);
//       },
//     );
//   }
// }
