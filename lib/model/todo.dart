import 'package:flutter/cupertino.dart';

class Todo {
  String title;
  String id;
  String date;
  bool isDone;

  Todo({
    @required this.title,
    this.date = '',
    this.id,
    this.isDone = false,
  });
}
