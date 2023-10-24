// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_todo_for_edit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoForEditImpl _$$TodoForEditImplFromJson(Map<String, dynamic> json) =>
    _$TodoForEditImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      modifiedTime: DateTime.parse(json['modifiedTime'] as String),
    );

Map<String, dynamic> _$$TodoForEditImplToJson(_$TodoForEditImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueDate': instance.dueDate.toIso8601String(),
      'modifiedTime': instance.modifiedTime.toIso8601String(),
    };
