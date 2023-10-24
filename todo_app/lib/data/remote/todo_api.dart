import 'package:dio/dio.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:fast_app_base/data/remote/clients/todo_client.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodoList();

  Future<int> addTodo(Todo todo);

  Future<void> editTodo(Todo todo);

  Future<void> deleteTodo(int id);
}

// TODO get_it 적용
class TodoApi implements TodoRepository {
  TodoApi._();

  final TodoClient client =
      TodoClient(Dio(BaseOptions(baseUrl: "http://localhost:8080/api/")));

  @override
  Future<int> addTodo(Todo todo) async {
    return await client.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(int id) async {
    await client.deleteTodo(id);
  }

  @override
  Future<void> editTodo(Todo todo) async {
    await client.updateTodo(todo);
  }

  @override
  Future<List<Todo>> getTodoList() async {
    return await client.getTodoList();
  }
}
