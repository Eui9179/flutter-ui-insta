import 'package:dio/dio.dart';
import 'package:fast_app_base/data/dto/dto_todo_for_save.dart';
import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:retrofit/http.dart';

part 'todo_client.g.dart';

@RestApi()
abstract class TodoClient {
  factory TodoClient(Dio dio) {
    return _TodoClient(dio);
  }

  @GET('/todos')
  Future<List<Todo>> getTodoList();

  @POST('/todo')
  Future<int> addTodo(@Body() TodoForSave todo);
  
  @PUT('/todo')
  Future<void> updateTodo(@Body() Todo todo);

  @DELETE('/todo/{id}')
  Future<void> deleteTodo(@Path("id") int id);
}