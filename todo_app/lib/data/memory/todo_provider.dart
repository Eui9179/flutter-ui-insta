import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class TodoProvider with ChangeNotifier {
  final List<Todo> todoList = [];

  void addTodo(WriteTodoResult result) {
    todoList.add(Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      title: result.text,
      dueDate: result.dateTime,
      createdTime: DateTime.now(),
    ));
    notifyListeners();
  }

  void editTodo(WriteTodoResult result, Todo oldTodo) {
    todoList.firstWhere((todo) => todo == oldTodo)
      ..title = result.text
      ..dueDate = result.dateTime;
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todoList.remove(todo);
    notifyListeners();
  }

  void changeTodoStatus(Todo todo) {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        todo.status = TodoStatus.incomplete;
    }
    notifyListeners();
  }
}
