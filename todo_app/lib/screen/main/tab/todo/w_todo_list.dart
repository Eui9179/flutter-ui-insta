import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/data/memory/todo_provider.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/tab/todo/w_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = context.watch<TodoProvider>().todoList;
    return todoList.isEmpty
        ? '할일을 작성해보세요'.text.size(30).makeCentered()
        : ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) =>
                TodoItem(todoList[index]),
          );
  }
}
