import 'package:fast_app_base/data/memory/vo_todo.dart';
import 'package:flutter/material.dart';

abstract class TodoEvent {}

class TodoAddEvent extends TodoEvent {
  final BuildContext context;

  TodoAddEvent(this.context);
}

class TodoStatusUpdateEvent extends TodoEvent {
  final BuildContext context;
  final Todo updatedTodo;

  TodoStatusUpdateEvent(this.context, this.updatedTodo);
}

class TodoContentUpdateEvent extends TodoEvent {
  final BuildContext context;
  final Todo updatedTodo;

  TodoContentUpdateEvent(this.context, this.updatedTodo);
}

class TodoRemovedEvent extends TodoEvent {
  final Todo removedTodo;

  TodoRemovedEvent(this.removedTodo);
}
