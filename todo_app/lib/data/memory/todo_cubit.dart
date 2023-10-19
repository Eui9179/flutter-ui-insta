import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoBlocState> {
  TodoCubit() : super(const TodoBlocState(BlocStatus.initial, <Todo>[]));

  void addTodo(BuildContext context) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(context);
    if (result != null) {
      final copiedOldTodoList = List.of(state.todoList);
      copiedOldTodoList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
        status: TodoStatus.incomplete,
      ));
      emitNewList(copiedOldTodoList);
    }
  }

  void changeTodoStatus(Todo todo) {
    final copiedOldTodoList = List.of(state.todoList);
    final int todoIndex = copiedOldTodoList.indexOf(todo);

    TodoStatus status = todo.status;
    switch (todo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        status = TodoStatus.incomplete;
    }

    copiedOldTodoList[todoIndex] = todo.copyWith(status: status);
    emitNewList(copiedOldTodoList);
  }

  void editTodo(BuildContext context, Todo todo) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(
      context,
      editTodo: todo,
    );
    if (result != null) {
      final copiedTodoList = List.of(state.todoList);
      copiedTodoList[copiedTodoList.indexOf(todo)] = todo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
      );
      emitNewList(copiedTodoList);
    }
  }

  void deleteTodo(Todo todo) async {
    final copiedTodoList = List.of(state.todoList);
    copiedTodoList.removeWhere((element) => element.id == todo.id);
    emitNewList(copiedTodoList);
  }

  void emitNewList(List<Todo> todoList) => emitNewList(todoList);
}
