import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:flutter/cupertino.dart';

import 'todo_data_notifier.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({
    super.key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    // 같은 위젯 트리에 속해있다면 어디에 있든 context를 찾아서 반환한다.
    return (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
  }

  void changeTodoStatus(Todo todo) {
    List<TodoStatus> todoStatusList = TodoStatus.values;
    int index = todoStatusList.indexOf(todo.status);
    int nextIndex = (index + 1) % todoStatusList.length;
    todo.status = todoStatusList[nextIndex];
    notifier.notify();
  }
}

extension TodoDataHolderContextExtension on BuildContext {
  TodoDataHolder get holder => TodoDataHolder._of(this);
}