import 'package:flutter/cupertino.dart';
import 'package:flutter_todolist/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _Todos = [
    Todo(
        title: 'Đánh răng dửa mặt',
        date: '07:00 - 02/12/2020'),
    Todo(
        title: 'Đi Làm',
        date: '07:30 - 08/12/2020'),
    Todo(
        title: 'Đi Ăn',
        date: '11:30 - 08/12/2020'),
  ];

// List<Todo>get todos=>_Todos.where((todo)=>todo.isDone==false).toList();
  List<Todo> get todos => _Todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todoFinished=>_Todos.where((todo) =>todo.isDone==true).toList();
  void addTodo(Todo todo) {
    _Todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _Todos.remove(todo);
    notifyListeners();
  }
  void updateTodo(Todo todo, String title,String description){
    todo.title=title;
    todo.date=description;
    notifyListeners();
  }
  bool checkStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
}
