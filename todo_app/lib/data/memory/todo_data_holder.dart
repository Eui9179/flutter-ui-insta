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

  static TodoDataHolder of(BuildContext context) {
    // 같은 위젯 트리에 속해있다면 어디에 있든 context를 찾아서 반환한다.
    return (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
  }
}