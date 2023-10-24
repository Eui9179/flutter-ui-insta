import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_todo.freezed.dart';

part 'vo_todo.g.dart';

@unfreezed
class Todo with _$Todo {
  Todo._();

  factory Todo({
    required final int id,
    required String title,
    required DateTime dueDate,
    @Default(TodoStatus.incomplete) TodoStatus status,
    required DateTime createdTime,
    DateTime? modifiedTime,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}
