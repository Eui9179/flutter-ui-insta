// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vo_todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoImpl _$$TodoImplFromJson(Map<String, dynamic> json) => _$TodoImpl(
      id: json['id'] as int,
      title: json['title'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: $enumDecodeNullable(_$TodoStatusEnumMap, json['status']) ??
          TodoStatus.incomplete,
      createdTime: DateTime.parse(json['createdTime'] as String),
      modifiedTime: json['modifiedTime'] == null
          ? null
          : DateTime.parse(json['modifiedTime'] as String),
    );

Map<String, dynamic> _$$TodoImplToJson(_$TodoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': _$TodoStatusEnumMap[instance.status]!,
      'createdTime': instance.createdTime.toIso8601String(),
      'modifiedTime': instance.modifiedTime?.toIso8601String(),
    };

const _$TodoStatusEnumMap = {
  TodoStatus.incomplete: 'incomplete',
  TodoStatus.ongoing: 'ongoing',
  TodoStatus.complete: 'complete',
};
