import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/widget/rounded_container.dart';
import 'package:fast_app_base/data/memory/todo_data_holder.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:flutter/material.dart';

import 'w_todo_status.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: 10),
      color: context.appColors.itemBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          todo.dueDate.relativeDays.text.size(12).make().pOnly(right: 10, left: 10),
          Row(
            children: [
              TodoStatusWidget(todo),
              Expanded(child: todo.title.text.size(20).medium.make()),
              IconButton(
                onPressed: () async {
                  context.holder.notifier.editTodo(context, todo);
                },
                icon: const Icon(
                  EvaIcons.editOutline,
                ),
              ),
            ],
          )
        ],
      ).pOnly(top: 10, right: 5, left: 5, bottom: 10),
    );
  }
}
