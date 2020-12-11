import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/todos.dart';
import 'package:flutter_todolist/utils.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todolist/editTodo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(todo.id),
      actions: [
        IconSlideAction(
          color: Colors.purple,
          onTap: () => editTodo(context, todo),
          caption: 'Sửa',
          icon: Icons.edit,
        )
      ],
      secondaryActions: [
        IconSlideAction(
          color: Colors.red,
          caption: 'Xóa',
          onTap: () => deleteTodo(context, todo),
          icon: Icons.delete,
        )
      ],
      child: buildTodo(context),
    ),
  );

  Widget buildTodo(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: todo.isDone,
          onChanged: (_) {
            final provider =
            Provider.of<TodosProvider>(context, listen: false);
            final isDone = provider.checkStatus(todo);
            Utils.showSnackBar(context,
                isDone ? 'Task Complete' : 'Task marked incomplete');
          },
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 14,
                ),
              ),
              Text(
                todo.date,
                style: TextStyle(fontSize: 10, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Đã xóa');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTodoPage(todo: todo),
    ),
  );
}
