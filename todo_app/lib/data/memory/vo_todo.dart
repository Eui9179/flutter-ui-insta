import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';

class Todo {
  Todo({
    required this.id,
    required this.title,
    required this.dueDate,
    this.status = TodoStatus.incomplete,
  }) : createdTime = DateTime.now();

  int id;
  String title;
  final DateTime createdTime;
  DateTime? modifyTime;
  DateTime dueDate;
  TodoStatus status;

  factory Todo.of(WriteTodoResult result) {
    return Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      title: result.text,
      dueDate: result.dateTime,
    );
  }
}
