// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dto_todo_for_edit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoForEdit _$TodoForEditFromJson(Map<String, dynamic> json) {
  return _TodoForEdit.fromJson(json);
}

/// @nodoc
mixin _$TodoForEdit {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  DateTime get modifiedTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoForEditCopyWith<TodoForEdit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoForEditCopyWith<$Res> {
  factory $TodoForEditCopyWith(
          TodoForEdit value, $Res Function(TodoForEdit) then) =
      _$TodoForEditCopyWithImpl<$Res, TodoForEdit>;
  @useResult
  $Res call({int id, String title, DateTime dueDate, DateTime modifiedTime});
}

/// @nodoc
class _$TodoForEditCopyWithImpl<$Res, $Val extends TodoForEdit>
    implements $TodoForEditCopyWith<$Res> {
  _$TodoForEditCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? dueDate = null,
    Object? modifiedTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedTime: null == modifiedTime
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoForEditImplCopyWith<$Res>
    implements $TodoForEditCopyWith<$Res> {
  factory _$$TodoForEditImplCopyWith(
          _$TodoForEditImpl value, $Res Function(_$TodoForEditImpl) then) =
      __$$TodoForEditImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, DateTime dueDate, DateTime modifiedTime});
}

/// @nodoc
class __$$TodoForEditImplCopyWithImpl<$Res>
    extends _$TodoForEditCopyWithImpl<$Res, _$TodoForEditImpl>
    implements _$$TodoForEditImplCopyWith<$Res> {
  __$$TodoForEditImplCopyWithImpl(
      _$TodoForEditImpl _value, $Res Function(_$TodoForEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? dueDate = null,
    Object? modifiedTime = null,
  }) {
    return _then(_$TodoForEditImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedTime: null == modifiedTime
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoForEditImpl implements _TodoForEdit {
  const _$TodoForEditImpl(
      {required this.id,
      required this.title,
      required this.dueDate,
      required this.modifiedTime});

  factory _$TodoForEditImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoForEditImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final DateTime dueDate;
  @override
  final DateTime modifiedTime;

  @override
  String toString() {
    return 'TodoForEdit(id: $id, title: $title, dueDate: $dueDate, modifiedTime: $modifiedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoForEditImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.modifiedTime, modifiedTime) ||
                other.modifiedTime == modifiedTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, dueDate, modifiedTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoForEditImplCopyWith<_$TodoForEditImpl> get copyWith =>
      __$$TodoForEditImplCopyWithImpl<_$TodoForEditImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoForEditImplToJson(
      this,
    );
  }
}

abstract class _TodoForEdit implements TodoForEdit {
  const factory _TodoForEdit(
      {required final int id,
      required final String title,
      required final DateTime dueDate,
      required final DateTime modifiedTime}) = _$TodoForEditImpl;

  factory _TodoForEdit.fromJson(Map<String, dynamic> json) =
      _$TodoForEditImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  DateTime get dueDate;
  @override
  DateTime get modifiedTime;
  @override
  @JsonKey(ignore: true)
  _$$TodoForEditImplCopyWith<_$TodoForEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
