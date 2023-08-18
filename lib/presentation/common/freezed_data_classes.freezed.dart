// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetArticlesObject {
  String get source => throw _privateConstructorUsedError;
  String get apiKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetArticlesObjectCopyWith<GetArticlesObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetArticlesObjectCopyWith<$Res> {
  factory $GetArticlesObjectCopyWith(
          GetArticlesObject value, $Res Function(GetArticlesObject) then) =
      _$GetArticlesObjectCopyWithImpl<$Res, GetArticlesObject>;
  @useResult
  $Res call({String source, String apiKey});
}

/// @nodoc
class _$GetArticlesObjectCopyWithImpl<$Res, $Val extends GetArticlesObject>
    implements $GetArticlesObjectCopyWith<$Res> {
  _$GetArticlesObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? apiKey = null,
  }) {
    return _then(_value.copyWith(
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetArticlesObjectCopyWith<$Res>
    implements $GetArticlesObjectCopyWith<$Res> {
  factory _$$_GetArticlesObjectCopyWith(_$_GetArticlesObject value,
          $Res Function(_$_GetArticlesObject) then) =
      __$$_GetArticlesObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, String apiKey});
}

/// @nodoc
class __$$_GetArticlesObjectCopyWithImpl<$Res>
    extends _$GetArticlesObjectCopyWithImpl<$Res, _$_GetArticlesObject>
    implements _$$_GetArticlesObjectCopyWith<$Res> {
  __$$_GetArticlesObjectCopyWithImpl(
      _$_GetArticlesObject _value, $Res Function(_$_GetArticlesObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? source = null,
    Object? apiKey = null,
  }) {
    return _then(_$_GetArticlesObject(
      null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetArticlesObject implements _GetArticlesObject {
  _$_GetArticlesObject(this.source, this.apiKey);

  @override
  final String source;
  @override
  final String apiKey;

  @override
  String toString() {
    return 'GetArticlesObject(source: $source, apiKey: $apiKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetArticlesObject &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, source, apiKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetArticlesObjectCopyWith<_$_GetArticlesObject> get copyWith =>
      __$$_GetArticlesObjectCopyWithImpl<_$_GetArticlesObject>(
          this, _$identity);
}

abstract class _GetArticlesObject implements GetArticlesObject {
  factory _GetArticlesObject(final String source, final String apiKey) =
      _$_GetArticlesObject;

  @override
  String get source;
  @override
  String get apiKey;
  @override
  @JsonKey(ignore: true)
  _$$_GetArticlesObjectCopyWith<_$_GetArticlesObject> get copyWith =>
      throw _privateConstructorUsedError;
}
