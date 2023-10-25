import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/get_it/get_it.dart';
import 'package:fast_app_base/data/memory/todo_provider.dart';
import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:flutter/cupertino.dart';

class TodoStatusWidget extends StatelessWidget {
  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = getIt.get<TodoProvider>();
    return Tap(
      onTap: () {
        todoProvider.updateTodoStatus(todo);
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: switch (todo.status) {
          TodoStatus.complete => CupertinoCheckbox(
              value: true,
              onChanged: null,
              checkColor: context.appColors.checkColor,
              activeColor: context.appColors.checkBoxColor,
              inactiveColor: context.appColors.checkBoxColor,
            ),
          TodoStatus.ongoing => CupertinoCheckbox(
              value: true,
              onChanged: null,
              checkColor: context.appColors.checkColor,
              inactiveColor: context.appColors.checkBoxOngoingColor,
            ),
          TodoStatus.incomplete => const CupertinoCheckbox(
              value: false,
              onChanged: null,
            ),
        },
      ),
    );
  }
}
