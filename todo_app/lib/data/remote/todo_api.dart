import 'package:dio/dio.dart';
import 'package:fast_app_base/data/dto/dto_todo_for_save.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/data/remote/clients/todo_client.dart';
import 'package:injectable/injectable.dart';

@singleton
class TodoApi implements TodoRepository {
  final TodoClient _client =
      TodoClient(Dio(BaseOptions(baseUrl: "http://localhost:8080/api/")));

  @override
  Future<int> addTodo(TodoForSave todo) async {
    return await _client.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await _client.deleteTodo(id);
  }

  @override
  Future<void> editTodo(Todo todo) async {
    await _client.updateTodo(todo);
  }

  @override
  Future<List<Todo>> getTodoList() async {
    return await _client.getTodoList();
  }
}

abstract interface class TodoRepository {
  Future<List<Todo>> getTodoList();

  Future<int> addTodo(TodoForSave todo);

  Future<void> editTodo(Todo todo);

  Future<void> deleteTodo(int id);
}
