import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/todo_widget.dart';
import 'package:flutter_todolist/todos.dart';
import 'package:provider/provider.dart';

class FinishedListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todoFinished;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoWidget(todo: todo);
      },
    );

  }
}
