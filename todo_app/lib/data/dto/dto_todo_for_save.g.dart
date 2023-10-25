// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_todo_for_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoForSaveImpl _$$TodoForSaveImplFromJson(Map<String, dynamic> json) =>
    _$TodoForSaveImpl(
      title: json['title'] as String,
      status: $enumDecode(_$TodoStatusEnumMap, json['status']),
      dueDate: DateTime.parse(json['dueDate'] as String),
      createdTime: DateTime.parse(json['createdTime'] as String),
    );

Map<String, dynamic> _$$TodoForSaveImplToJson(_$TodoForSaveImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': _$TodoStatusEnumMap[instance.status]!,
      'dueDate': instance.dueDate.toIso8601String(),
      'createdTime': instance.createdTime.toIso8601String(),
    };

const _$TodoStatusEnumMap = {
  TodoStatus.incomplete: 'incomplete',
  TodoStatus.ongoing: 'ongoing',
  TodoStatus.complete: 'complete',
};
