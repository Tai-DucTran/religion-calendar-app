// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserInfoPayLoad _$UserInfoPayLoadFromJson(Map<String, dynamic> json) {
  return _UserInfoPayLoad.fromJson(json);
}

/// @nodoc
mixin _$UserInfoPayLoad {
  String get userId => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  Religion? get religionReference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserInfoPayLoadCopyWith<UserInfoPayLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoPayLoadCopyWith<$Res> {
  factory $UserInfoPayLoadCopyWith(
          UserInfoPayLoad value, $Res Function(UserInfoPayLoad) then) =
      _$UserInfoPayLoadCopyWithImpl<$Res, UserInfoPayLoad>;
  @useResult
  $Res call(
      {String userId,
      String? displayName,
      String? email,
      DateTime? createdAt,
      Religion? religionReference});
}

/// @nodoc
class _$UserInfoPayLoadCopyWithImpl<$Res, $Val extends UserInfoPayLoad>
    implements $UserInfoPayLoadCopyWith<$Res> {
  _$UserInfoPayLoadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? religionReference = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      religionReference: freezed == religionReference
          ? _value.religionReference
          : religionReference // ignore: cast_nullable_to_non_nullable
              as Religion?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoPayLoadImplCopyWith<$Res>
    implements $UserInfoPayLoadCopyWith<$Res> {
  factory _$$UserInfoPayLoadImplCopyWith(_$UserInfoPayLoadImpl value,
          $Res Function(_$UserInfoPayLoadImpl) then) =
      __$$UserInfoPayLoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String? displayName,
      String? email,
      DateTime? createdAt,
      Religion? religionReference});
}

/// @nodoc
class __$$UserInfoPayLoadImplCopyWithImpl<$Res>
    extends _$UserInfoPayLoadCopyWithImpl<$Res, _$UserInfoPayLoadImpl>
    implements _$$UserInfoPayLoadImplCopyWith<$Res> {
  __$$UserInfoPayLoadImplCopyWithImpl(
      _$UserInfoPayLoadImpl _value, $Res Function(_$UserInfoPayLoadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? createdAt = freezed,
    Object? religionReference = freezed,
  }) {
    return _then(_$UserInfoPayLoadImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      religionReference: freezed == religionReference
          ? _value.religionReference
          : religionReference // ignore: cast_nullable_to_non_nullable
              as Religion?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoPayLoadImpl extends _UserInfoPayLoad {
  const _$UserInfoPayLoadImpl(
      {required this.userId,
      required this.displayName,
      required this.email,
      this.createdAt,
      this.religionReference})
      : super._();

  factory _$UserInfoPayLoadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoPayLoadImplFromJson(json);

  @override
  final String userId;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final DateTime? createdAt;
  @override
  final Religion? religionReference;

  @override
  String toString() {
    return 'UserInfoPayLoad(userId: $userId, displayName: $displayName, email: $email, createdAt: $createdAt, religionReference: $religionReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoPayLoadImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.religionReference, religionReference) ||
                other.religionReference == religionReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, displayName, email, createdAt, religionReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoPayLoadImplCopyWith<_$UserInfoPayLoadImpl> get copyWith =>
      __$$UserInfoPayLoadImplCopyWithImpl<_$UserInfoPayLoadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoPayLoadImplToJson(
      this,
    );
  }
}

abstract class _UserInfoPayLoad extends UserInfoPayLoad {
  const factory _UserInfoPayLoad(
      {required final String userId,
      required final String? displayName,
      required final String? email,
      final DateTime? createdAt,
      final Religion? religionReference}) = _$UserInfoPayLoadImpl;
  const _UserInfoPayLoad._() : super._();

  factory _UserInfoPayLoad.fromJson(Map<String, dynamic> json) =
      _$UserInfoPayLoadImpl.fromJson;

  @override
  String get userId;
  @override
  String? get displayName;
  @override
  String? get email;
  @override
  DateTime? get createdAt;
  @override
  Religion? get religionReference;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoPayLoadImplCopyWith<_$UserInfoPayLoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
