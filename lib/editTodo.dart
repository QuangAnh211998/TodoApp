import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/todo_form.dart';
import 'package:flutter_todolist/todos.dart';
import 'package:provider/provider.dart';

import 'model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String title;
  String date;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    date = widget.todo.date;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Edit todo'),
      actions: [
        IconButton(icon: Icon(Icons.delete),
            onPressed: (){
              final provider =
              Provider.of<TodosProvider>(context,listen: false);
              provider.removeTodo(widget.todo);
              Navigator.of(context).pop();
            })
      ],
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: TodoFormWidget(
          title: title,
          description: date,
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (date) =>
              setState(() => this.date = date),
          onSavedTodo: saveTodo,
        ),
      ),
    ),
  );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid)
      return;
    else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title, date);
      Navigator.of(context).pop();
    }
  }
}
