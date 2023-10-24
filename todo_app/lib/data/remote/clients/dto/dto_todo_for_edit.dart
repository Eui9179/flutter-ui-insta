import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto_todo_for_edit.freezed.dart';

part 'dto_todo_for_edit.g.dart';

@freezed
class TodoForEdit with _$TodoForEdit {
  const factory TodoForEdit({
    required int id,
    required String title,
    required DateTime dueDate,
    required DateTime modifiedTime,
  }) = _TodoForEdit;

  factory TodoForEdit.fromJson(Map<String, dynamic> json) =>
      _$TodoForEditFromJson(json);
}
