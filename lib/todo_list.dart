import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/todo_widget.dart';
import 'package:flutter_todolist/todos.dart';
import 'package:provider/provider.dart';

class TodoListWiget extends StatefulWidget {
  @override
  _TodoListWigetState createState() => _TodoListWigetState();
}
class _TodoListWigetState extends State<TodoListWiget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    final todofinished = provider.todoFinished;
    return new Scaffold(
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Text('Todo Job',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize:20),
            ),
            new Container(
              width: screenSize.width,
              height: screenSize.height/3,
              color: Colors.purple[50],
              child: new ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return TodoWidget(todo: todo);
                },
              ),
            ),
            new Text('Todo Finished' ,
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            new Container(
              width: screenSize.width,
              height: screenSize.height / 2,
              color: Colors.purple[100],
              child: new ListView.builder(
                itemCount: todofinished.length,
                itemBuilder: (context, index) {
                  final todo = todofinished[index];
                  return TodoWidget(todo: todo);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class  TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoWidget(todo: todo);
      },
    );
  }
}


