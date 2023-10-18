import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/cupertino.dart';

class TodoDataNotifier extends ValueNotifier<List<Todo>> {
  TodoDataNotifier() : super([]);

  void addTodo(BuildContext context) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(context);
    if (result != null) {
      value.add(Todo.of(result));
    }
    notifyListeners();
  }

  void editTodo(BuildContext context, Todo todo) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(
      context,
      editTodo: todo,
    );
    if (result != null) {
      value.firstWhere((t) => t.id == todo.id)
        ..title = result.text
        ..dueDate = result.dateTime;
      notifyListeners();
    }
  }

  void notify() {
    notifyListeners();
  }

  void deleteTodo(Todo todo) async {
    value.remove(todo);
    notifyListeners();
  }
}
