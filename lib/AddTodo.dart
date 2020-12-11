import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/todo_form.dart';
import 'package:flutter_todolist/todos.dart';
import 'package:provider/provider.dart';

class DialogNhap extends StatefulWidget {
  @override
  _DialogNhapState createState() => _DialogNhapState();
}

class _DialogNhapState extends State<DialogNhap> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String dateatime = '';

  @override
  Widget build(BuildContext context) =>
      AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todo Job',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 8),
              TodoFormWidget(
                onChangedTitle: (title) => setState(() => this.title = title),
                onChangedDescription: (description) =>
                    setState(() => this.dateatime = description),
                onSavedTodo: addTodo,
              )
            ],
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    } else {
      final todo = Todo(title: title, date: dateatime);
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}