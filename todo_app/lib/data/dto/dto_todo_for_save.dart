import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_todo_for_save.freezed.dart';

part 'dto_todo_for_save.g.dart';

@freezed
class TodoForSave with _$TodoForSave {
  factory TodoForSave({
    required String title,
    required TodoStatus status,
    required DateTime dueDate,
    required DateTime createdTime,
  }) = _TodoForSave;

  factory TodoForSave.fromJson(Map<String, dynamic> json) =>
      _$TodoForSaveFromJson(json);

  factory TodoForSave.of(WriteTodoResult result) => TodoForSave(
        title: result.text,
        status: TodoStatus.incomplete,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
  );
}
