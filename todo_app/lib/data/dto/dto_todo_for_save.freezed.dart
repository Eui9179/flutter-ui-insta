// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_todo_for_save.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoForSave _$TodoForSaveFromJson(Map<String, dynamic> json) {
  return _TodoForSave.fromJson(json);
}

/// @nodoc
mixin _$TodoForSave {
  String get title => throw _privateConstructorUsedError;
  TodoStatus get status => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  DateTime get createdTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoForSaveCopyWith<TodoForSave> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoForSaveCopyWith<$Res> {
  factory $TodoForSaveCopyWith(
          TodoForSave value, $Res Function(TodoForSave) then) =
      _$TodoForSaveCopyWithImpl<$Res, TodoForSave>;
  @useResult
  $Res call(
      {String title,
      TodoStatus status,
      DateTime dueDate,
      DateTime createdTime});
}

/// @nodoc
class _$TodoForSaveCopyWithImpl<$Res, $Val extends TodoForSave>
    implements $TodoForSaveCopyWith<$Res> {
  _$TodoForSaveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? status = null,
    Object? dueDate = null,
    Object? createdTime = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoForSaveImplCopyWith<$Res>
    implements $TodoForSaveCopyWith<$Res> {
  factory _$$TodoForSaveImplCopyWith(
          _$TodoForSaveImpl value, $Res Function(_$TodoForSaveImpl) then) =
      __$$TodoForSaveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      TodoStatus status,
      DateTime dueDate,
      DateTime createdTime});
}

/// @nodoc
class __$$TodoForSaveImplCopyWithImpl<$Res>
    extends _$TodoForSaveCopyWithImpl<$Res, _$TodoForSaveImpl>
    implements _$$TodoForSaveImplCopyWith<$Res> {
  __$$TodoForSaveImplCopyWithImpl(
      _$TodoForSaveImpl _value, $Res Function(_$TodoForSaveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? status = null,
    Object? dueDate = null,
    Object? createdTime = null,
  }) {
    return _then(_$TodoForSaveImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TodoStatus,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdTime: null == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoForSaveImpl implements _TodoForSave {
  _$TodoForSaveImpl(
      {required this.title,
      required this.status,
      required this.dueDate,
      required this.createdTime});

  factory _$TodoForSaveImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoForSaveImplFromJson(json);

  @override
  final String title;
  @override
  final TodoStatus status;
  @override
  final DateTime dueDate;
  @override
  final DateTime createdTime;

  @override
  String toString() {
    return 'TodoForSave(title: $title, status: $status, dueDate: $dueDate, createdTime: $createdTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoForSaveImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, status, dueDate, createdTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoForSaveImplCopyWith<_$TodoForSaveImpl> get copyWith =>
      __$$TodoForSaveImplCopyWithImpl<_$TodoForSaveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoForSaveImplToJson(
      this,
    );
  }
}

abstract class _TodoForSave implements TodoForSave {
  factory _TodoForSave(
      {required final String title,
      required final TodoStatus status,
      required final DateTime dueDate,
      required final DateTime createdTime}) = _$TodoForSaveImpl;

  factory _TodoForSave.fromJson(Map<String, dynamic> json) =
      _$TodoForSaveImpl.fromJson;

  @override
  String get title;
  @override
  TodoStatus get status;
  @override
  DateTime get dueDate;
  @override
  DateTime get createdTime;
  @override
  @JsonKey(ignore: true)
  _$$TodoForSaveImplCopyWith<_$TodoForSaveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
