import 'package:fast_app_base/data/memory/bloc/bloc_status.dart';
import 'package:fast_app_base/data/memory/bloc/todo_bloc_state.dart';
import 'package:fast_app_base/data/memory/bloc/todo_event.dart';
import 'package:fast_app_base/data/memory/todo_state.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/screen/main/write/d_write_todo.dart';
import 'package:fast_app_base/screen/main/write/vo_write_todo_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoBlocState> {
  TodoBloc() : super(const TodoBlocState(BlocStatus.initial, <Todo>[])) {
    on<TodoAddEvent>(_addTodo);
    on<TodoStatusUpdateEvent>(_changeTodoStatus);
    on<TodoContentUpdateEvent>(_editTodo);
    on<TodoRemovedEvent>(_removeTodo);
  }

  void _addTodo(TodoAddEvent event, Emitter<TodoBlocState> emit) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(event.context);
    if (result != null) {
      final copiedOldTodoList = List.of(state.todoList);
      copiedOldTodoList.add(Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        title: result.text,
        dueDate: result.dateTime,
        createdTime: DateTime.now(),
        status: TodoStatus.incomplete,
      ));
      _emitNewList(copiedOldTodoList, emit);
    }
  }

  void _changeTodoStatus(
    TodoStatusUpdateEvent event,
    Emitter<TodoBlocState> emit,
  ) {
    final copiedOldTodoList = List.of(state.todoList);
    final int todoIndex = copiedOldTodoList.indexOf(event.updatedTodo);

    TodoStatus status = event.updatedTodo.status;
    switch (event.updatedTodo.status) {
      case TodoStatus.incomplete:
        status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        status = TodoStatus.complete;
      case TodoStatus.complete:
        status = TodoStatus.incomplete;
    }

    copiedOldTodoList[todoIndex] = event.updatedTodo.copyWith(status: status);
    _emitNewList(copiedOldTodoList, emit);
  }

  void _editTodo(
    TodoContentUpdateEvent event,
    Emitter<TodoBlocState> emit,
  ) async {
    final WriteTodoResult? result = await writeTodoBottomSheet(
      event.context,
      editTodo: event.updatedTodo,
    );
    if (result != null) {
      final copiedTodoList = List.of(state.todoList);
      final int todoIndex = copiedTodoList.indexOf(event.updatedTodo);
      copiedTodoList[todoIndex] = event.updatedTodo.copyWith(
        title: result.text,
        dueDate: result.dateTime,
      );
      _emitNewList(copiedTodoList, emit);
    }
  }

  void _removeTodo(TodoRemovedEvent event, Emitter<TodoBlocState> emit) async {
    final copiedTodoList = List<Todo>.from(state.todoList);
    copiedTodoList.removeWhere((element) => element.id == event.removedTodo.id);
    _emitNewList(copiedTodoList, emit);
  }

  void _emitNewList(List<Todo> todoList, Emitter emit) =>
      emit(state.copyWith(todoList: todoList));
}
