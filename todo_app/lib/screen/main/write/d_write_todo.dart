import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/constant_widget.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DateTime _selectedDate = DateTime.now();

Future<WriteTodoResult?> writeTodoBottomSheet(
  BuildContext context, {
  Todo? editTodo,
}) {
  const double bottomSheetRadius = 15;
  final textController = TextEditingController(text: editTodo?.title);
  final node = FocusNode();

  return showModalBottomSheet<WriteTodoResult?>(
    useRootNavigator: true,
    isScrollControlled: true,
    context: context,
    backgroundColor: context.backgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(bottomSheetRadius),
        topLeft: Radius.circular(bottomSheetRadius),
      ),
    ),
    builder: (context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  '할일을 작성해주세요'.text.size(18).bold.make(),
                  spacer,
                  _selectedDate.formattedDate.text.make(),
                  // IconButton(
                  //   onPressed: () => _selectDate(context, setState),
                  //   icon: const Icon(Icons.calendar_month),
                  // ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime:
                      editTodo == null ? _selectedDate : editTodo.dueDate,
                  onDateTimeChanged: (DateTime date) {
                    setState(() => _selectedDate = date);
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      focusNode: node,
                      controller: textController,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: context.primaryColor))),
                    ),
                  ),
                  RoundButton(
                    text: isEditMode(editTodo) ? '완료' : '추가',
                    height: 40,
                    borderRadius: 12,
                    bgColor: context.primaryColor,
                    onTap: () => addTodo(context, textController),
                  ),
                ],
              ).pSymmetric(v: 20)
            ],
          ).pSymmetric(v: 16, h: 20),
        );
      });
    },
  );
}

bool isEditMode(Todo? editTodo) => editTodo != null;

void addTodo(BuildContext context, TextEditingController textController) {
  return Navigator.of(context).pop(
    WriteTodoResult(
      _selectedDate,
      textController.text,
    ),
  );
}

Future<DateTime?> _getPickedDate(
    BuildContext context, DateTime selectedDate) async {
  return await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime.now().subtract(const Duration(days: 365)),
    lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
  );
}

void _selectDate(BuildContext context, StateSetter setState) async {
  final DateTime? date = await _getPickedDate(context, _selectedDate);
  if (date != null) {
    setState(() => _selectedDate = date);
  }
}
