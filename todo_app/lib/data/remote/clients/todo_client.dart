import 'package:dio/dio.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:retrofit/http.dart';

part 'todo_client.g.dart';

@RestApi()
abstract class TodoClient {
  factory TodoClient(Dio dio, {String? baseUrl}) {
    return _TodoClient(dio, baseUrl: 'http://localhost:8080/api/');
  }

  @GET('/todos')
  Future<List<Todo>> getTodoList();

  @POST('/todo')
  Future<int> addTodo(@Body() Todo todo);
  
  @PUT('/todo')
  Future<void> updateTodo(@Body() Todo todo);

  @DELETE('/todo/{id}')
  Future<void> deleteTodo(@Path("id") int id);
}