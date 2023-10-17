import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/constant_widget.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/material.dart';

DateTime _selectedDate = DateTime.now();

Future<WriteTodoResult?> writeTodoBottomSheet(BuildContext context) {
  const double bottomSheetRadius = 15;
  final textController = TextEditingController();
  final node = FocusNode();

  return showModalBottomSheet<WriteTodoResult?>(
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
                  IconButton(
                    onPressed: () => _selectDate(context, setState),
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      focusNode: node,
                      controller: textController,
                    ),
                  ),
                  RoundButton(
                    text: '추가',
                    onTap: () => addTodo(context, textController),
                  ),
                ],
              ).pSymmetric(v: 20)
            ],
          ).pSymmetric(v: 12, h: 20),
        );
      });
    },
  );
}

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
