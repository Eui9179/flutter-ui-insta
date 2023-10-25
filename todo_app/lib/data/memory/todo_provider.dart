import 'package:fast_app_base/common/get_it/get_it.dart';
import 'package:fast_app_base/data/dto/dto_todo_for_save.dart';
import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/data/remote/todo_api.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class TodoProvider with ChangeNotifier {
  final List<Todo> todoList = [];

  final TodoApi todoRepository = getIt.get<TodoApi>();

  TodoProvider() {
    _initTodoData();
    notifyListeners();
  }

  void addTodo(WriteTodoResult result) {
    final todoForSave = TodoForSave.of(result);
    todoRepository.addTodo(todoForSave).then((id) {
      todoList.add(Todo(
        id: id,
        title: todoForSave.title,
        dueDate: todoForSave.dueDate,
        createdTime: todoForSave.createdTime,
      ));
      notifyListeners();
    });
  }

  void updateTodoStatus(Todo todo) {
    changeTodoStatus(todo);
    editTodo(todo);
  }

  void editTodo(Todo todoForSave) {
    todoForSave.modifiedTime = DateTime.now();
    todoRepository.editTodo(todoForSave).then((_) {
      final todo = todoList.firstWhere((todo) => todo.id == todoForSave.id);
      todo
        ..title = todoForSave.title
        ..dueDate = todoForSave.dueDate
        ..modifiedTime = todoForSave.modifiedTime
        ..status = todoForSave.status;
      notifyListeners();
    });
  }

  void deleteTodo(Todo todo) {
    todoRepository.deleteTodo(todo.id).then((value) {
      todoList.remove(todo);
      notifyListeners();
    });
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
  }

  void _initTodoData() async {
    List<Todo> remoteTodoList = await todoRepository.getTodoList();
    todoList.addAll(remoteTodoList);
  }
}
