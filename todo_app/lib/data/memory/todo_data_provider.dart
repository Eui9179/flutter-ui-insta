import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/material.dart';

class TodoDataProvider with ChangeNotifier {
  final List<Todo> todoList = [];

  void addTodo(BuildContext context) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(context);
    if (result != null) {
      todoList.add(Todo.of(result));
    }
    notifyListeners();
  }

  void editTodo(BuildContext context, Todo oldTodo) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(
      context,
      editTodo: oldTodo,
    );
    if (result != null) {
      todoList.firstWhere((todo) => todo == oldTodo)
        ..title = result.text
        ..dueDate = result.dateTime;
    }
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
