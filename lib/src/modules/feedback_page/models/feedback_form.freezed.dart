// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackForm _$FeedbackFormFromJson(Map<String, dynamic> json) {
  return _FeedbackForm.fromJson(json);
}

/// @nodoc
mixin _$FeedbackForm {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get userDisplayName => throw _privateConstructorUsedError;
  String? get userEmail => throw _privateConstructorUsedError;
  FeedbackResponseStatus? get status => throw _privateConstructorUsedError;
  String? get feedbackText => throw _privateConstructorUsedError;
  FeedbackType? get feedbackType => throw _privateConstructorUsedError;
  String? get feedbackResponse => throw _privateConstructorUsedError;
  FeelingRates? get selectedSentiment => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FeedbackForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackFormCopyWith<FeedbackForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackFormCopyWith<$Res> {
  factory $FeedbackFormCopyWith(
          FeedbackForm value, $Res Function(FeedbackForm) then) =
      _$FeedbackFormCopyWithImpl<$Res, FeedbackForm>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? userDisplayName,
      String? userEmail,
      FeedbackResponseStatus? status,
      String? feedbackText,
      FeedbackType? feedbackType,
      String? feedbackResponse,
      FeelingRates? selectedSentiment,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$FeedbackFormCopyWithImpl<$Res, $Val extends FeedbackForm>
    implements $FeedbackFormCopyWith<$Res> {
  _$FeedbackFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userDisplayName = freezed,
    Object? userEmail = freezed,
    Object? status = freezed,
    Object? feedbackText = freezed,
    Object? feedbackType = freezed,
    Object? feedbackResponse = freezed,
    Object? selectedSentiment = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: freezed == userDisplayName
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeedbackResponseStatus?,
      feedbackText: freezed == feedbackText
          ? _value.feedbackText
          : feedbackText // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackType: freezed == feedbackType
          ? _value.feedbackType
          : feedbackType // ignore: cast_nullable_to_non_nullable
              as FeedbackType?,
      feedbackResponse: freezed == feedbackResponse
          ? _value.feedbackResponse
          : feedbackResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSentiment: freezed == selectedSentiment
          ? _value.selectedSentiment
          : selectedSentiment // ignore: cast_nullable_to_non_nullable
              as FeelingRates?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackFormImplCopyWith<$Res>
    implements $FeedbackFormCopyWith<$Res> {
  factory _$$FeedbackFormImplCopyWith(
          _$FeedbackFormImpl value, $Res Function(_$FeedbackFormImpl) then) =
      __$$FeedbackFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? userDisplayName,
      String? userEmail,
      FeedbackResponseStatus? status,
      String? feedbackText,
      FeedbackType? feedbackType,
      String? feedbackResponse,
      FeelingRates? selectedSentiment,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$FeedbackFormImplCopyWithImpl<$Res>
    extends _$FeedbackFormCopyWithImpl<$Res, _$FeedbackFormImpl>
    implements _$$FeedbackFormImplCopyWith<$Res> {
  __$$FeedbackFormImplCopyWithImpl(
      _$FeedbackFormImpl _value, $Res Function(_$FeedbackFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userDisplayName = freezed,
    Object? userEmail = freezed,
    Object? status = freezed,
    Object? feedbackText = freezed,
    Object? feedbackType = freezed,
    Object? feedbackResponse = freezed,
    Object? selectedSentiment = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$FeedbackFormImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: freezed == userDisplayName
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String?,
      userEmail: freezed == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FeedbackResponseStatus?,
      feedbackText: freezed == feedbackText
          ? _value.feedbackText
          : feedbackText // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackType: freezed == feedbackType
          ? _value.feedbackType
          : feedbackType // ignore: cast_nullable_to_non_nullable
              as FeedbackType?,
      feedbackResponse: freezed == feedbackResponse
          ? _value.feedbackResponse
          : feedbackResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedSentiment: freezed == selectedSentiment
          ? _value.selectedSentiment
          : selectedSentiment // ignore: cast_nullable_to_non_nullable
              as FeelingRates?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackFormImpl extends _FeedbackForm {
  const _$FeedbackFormImpl(
      {required this.id,
      required this.userId,
      this.userDisplayName,
      this.userEmail,
      this.status = FeedbackResponseStatus.pending,
      this.feedbackText = '',
      this.feedbackType = FeedbackType.featureRecommendation,
      this.feedbackResponse = '',
      this.selectedSentiment,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$FeedbackFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackFormImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? userDisplayName;
  @override
  final String? userEmail;
  @override
  @JsonKey()
  final FeedbackResponseStatus? status;
  @override
  @JsonKey()
  final String? feedbackText;
  @override
  @JsonKey()
  final FeedbackType? feedbackType;
  @override
  @JsonKey()
  final String? feedbackResponse;
  @override
  final FeelingRates? selectedSentiment;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'FeedbackForm(id: $id, userId: $userId, userDisplayName: $userDisplayName, userEmail: $userEmail, status: $status, feedbackText: $feedbackText, feedbackType: $feedbackType, feedbackResponse: $feedbackResponse, selectedSentiment: $selectedSentiment, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackFormImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userDisplayName, userDisplayName) ||
                other.userDisplayName == userDisplayName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feedbackText, feedbackText) ||
                other.feedbackText == feedbackText) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.feedbackResponse, feedbackResponse) ||
                other.feedbackResponse == feedbackResponse) &&
            (identical(other.selectedSentiment, selectedSentiment) ||
                other.selectedSentiment == selectedSentiment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      userDisplayName,
      userEmail,
      status,
      feedbackText,
      feedbackType,
      feedbackResponse,
      selectedSentiment,
      createdAt,
      updatedAt);

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackFormImplCopyWith<_$FeedbackFormImpl> get copyWith =>
      __$$FeedbackFormImplCopyWithImpl<_$FeedbackFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackFormImplToJson(
      this,
    );
  }
}

abstract class _FeedbackForm extends FeedbackForm {
  const factory _FeedbackForm(
      {required final String id,
      required final String userId,
      final String? userDisplayName,
      final String? userEmail,
      final FeedbackResponseStatus? status,
      final String? feedbackText,
      final FeedbackType? feedbackType,
      final String? feedbackResponse,
      final FeelingRates? selectedSentiment,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$FeedbackFormImpl;
  const _FeedbackForm._() : super._();

  factory _FeedbackForm.fromJson(Map<String, dynamic> json) =
      _$FeedbackFormImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get userDisplayName;
  @override
  String? get userEmail;
  @override
  FeedbackResponseStatus? get status;
  @override
  String? get feedbackText;
  @override
  FeedbackType? get feedbackType;
  @override
  String? get feedbackResponse;
  @override
  FeelingRates? get selectedSentiment;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackFormImplCopyWith<_$FeedbackFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
