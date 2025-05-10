// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_conversation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackConversation _$FeedbackConversationFromJson(Map<String, dynamic> json) {
  return _FeedbackConversation.fromJson(json);
}

/// @nodoc
mixin _$FeedbackConversation {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get userDisplayName => throw _privateConstructorUsedError;
  String? get userEmail => throw _privateConstructorUsedError;
  FeedbackResponseStatus? get status => throw _privateConstructorUsedError;
  String? get feedbackTitle => throw _privateConstructorUsedError;
  FeedbackType? get feedbackType => throw _privateConstructorUsedError;
  FeelingRates? get selectedSentiment => throw _privateConstructorUsedError;
  List<FeedbackMessage> get messages => throw _privateConstructorUsedError;
  String? get feedbackImageUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FeedbackConversation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackConversationCopyWith<FeedbackConversation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackConversationCopyWith<$Res> {
  factory $FeedbackConversationCopyWith(FeedbackConversation value,
          $Res Function(FeedbackConversation) then) =
      _$FeedbackConversationCopyWithImpl<$Res, FeedbackConversation>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? userDisplayName,
      String? userEmail,
      FeedbackResponseStatus? status,
      String? feedbackTitle,
      FeedbackType? feedbackType,
      FeelingRates? selectedSentiment,
      List<FeedbackMessage> messages,
      String? feedbackImageUrl,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$FeedbackConversationCopyWithImpl<$Res,
        $Val extends FeedbackConversation>
    implements $FeedbackConversationCopyWith<$Res> {
  _$FeedbackConversationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userDisplayName = freezed,
    Object? userEmail = freezed,
    Object? status = freezed,
    Object? feedbackTitle = freezed,
    Object? feedbackType = freezed,
    Object? selectedSentiment = freezed,
    Object? messages = null,
    Object? feedbackImageUrl = freezed,
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
      feedbackTitle: freezed == feedbackTitle
          ? _value.feedbackTitle
          : feedbackTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackType: freezed == feedbackType
          ? _value.feedbackType
          : feedbackType // ignore: cast_nullable_to_non_nullable
              as FeedbackType?,
      selectedSentiment: freezed == selectedSentiment
          ? _value.selectedSentiment
          : selectedSentiment // ignore: cast_nullable_to_non_nullable
              as FeelingRates?,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<FeedbackMessage>,
      feedbackImageUrl: freezed == feedbackImageUrl
          ? _value.feedbackImageUrl
          : feedbackImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$FeedbackConversationImplCopyWith<$Res>
    implements $FeedbackConversationCopyWith<$Res> {
  factory _$$FeedbackConversationImplCopyWith(_$FeedbackConversationImpl value,
          $Res Function(_$FeedbackConversationImpl) then) =
      __$$FeedbackConversationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? userDisplayName,
      String? userEmail,
      FeedbackResponseStatus? status,
      String? feedbackTitle,
      FeedbackType? feedbackType,
      FeelingRates? selectedSentiment,
      List<FeedbackMessage> messages,
      String? feedbackImageUrl,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$FeedbackConversationImplCopyWithImpl<$Res>
    extends _$FeedbackConversationCopyWithImpl<$Res, _$FeedbackConversationImpl>
    implements _$$FeedbackConversationImplCopyWith<$Res> {
  __$$FeedbackConversationImplCopyWithImpl(_$FeedbackConversationImpl _value,
      $Res Function(_$FeedbackConversationImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackConversation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userDisplayName = freezed,
    Object? userEmail = freezed,
    Object? status = freezed,
    Object? feedbackTitle = freezed,
    Object? feedbackType = freezed,
    Object? selectedSentiment = freezed,
    Object? messages = null,
    Object? feedbackImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$FeedbackConversationImpl(
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
      feedbackTitle: freezed == feedbackTitle
          ? _value.feedbackTitle
          : feedbackTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackType: freezed == feedbackType
          ? _value.feedbackType
          : feedbackType // ignore: cast_nullable_to_non_nullable
              as FeedbackType?,
      selectedSentiment: freezed == selectedSentiment
          ? _value.selectedSentiment
          : selectedSentiment // ignore: cast_nullable_to_non_nullable
              as FeelingRates?,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<FeedbackMessage>,
      feedbackImageUrl: freezed == feedbackImageUrl
          ? _value.feedbackImageUrl
          : feedbackImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$FeedbackConversationImpl extends _FeedbackConversation {
  const _$FeedbackConversationImpl(
      {required this.id,
      required this.userId,
      this.userDisplayName,
      this.userEmail,
      this.status = FeedbackResponseStatus.pending,
      this.feedbackTitle = '',
      this.feedbackType = FeedbackType.featureRecommendation,
      this.selectedSentiment,
      final List<FeedbackMessage> messages = const [],
      this.feedbackImageUrl = null,
      required this.createdAt,
      required this.updatedAt})
      : _messages = messages,
        super._();

  factory _$FeedbackConversationImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackConversationImplFromJson(json);

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
  final String? feedbackTitle;
  @override
  @JsonKey()
  final FeedbackType? feedbackType;
  @override
  final FeelingRates? selectedSentiment;
  final List<FeedbackMessage> _messages;
  @override
  @JsonKey()
  List<FeedbackMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final String? feedbackImageUrl;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'FeedbackConversation(id: $id, userId: $userId, userDisplayName: $userDisplayName, userEmail: $userEmail, status: $status, feedbackTitle: $feedbackTitle, feedbackType: $feedbackType, selectedSentiment: $selectedSentiment, messages: $messages, feedbackImageUrl: $feedbackImageUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackConversationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userDisplayName, userDisplayName) ||
                other.userDisplayName == userDisplayName) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feedbackTitle, feedbackTitle) ||
                other.feedbackTitle == feedbackTitle) &&
            (identical(other.feedbackType, feedbackType) ||
                other.feedbackType == feedbackType) &&
            (identical(other.selectedSentiment, selectedSentiment) ||
                other.selectedSentiment == selectedSentiment) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.feedbackImageUrl, feedbackImageUrl) ||
                other.feedbackImageUrl == feedbackImageUrl) &&
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
      feedbackTitle,
      feedbackType,
      selectedSentiment,
      const DeepCollectionEquality().hash(_messages),
      feedbackImageUrl,
      createdAt,
      updatedAt);

  /// Create a copy of FeedbackConversation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackConversationImplCopyWith<_$FeedbackConversationImpl>
      get copyWith =>
          __$$FeedbackConversationImplCopyWithImpl<_$FeedbackConversationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackConversationImplToJson(
      this,
    );
  }
}

abstract class _FeedbackConversation extends FeedbackConversation {
  const factory _FeedbackConversation(
      {required final String id,
      required final String userId,
      final String? userDisplayName,
      final String? userEmail,
      final FeedbackResponseStatus? status,
      final String? feedbackTitle,
      final FeedbackType? feedbackType,
      final FeelingRates? selectedSentiment,
      final List<FeedbackMessage> messages,
      final String? feedbackImageUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$FeedbackConversationImpl;
  const _FeedbackConversation._() : super._();

  factory _FeedbackConversation.fromJson(Map<String, dynamic> json) =
      _$FeedbackConversationImpl.fromJson;

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
  String? get feedbackTitle;
  @override
  FeedbackType? get feedbackType;
  @override
  FeelingRates? get selectedSentiment;
  @override
  List<FeedbackMessage> get messages;
  @override
  String? get feedbackImageUrl;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of FeedbackConversation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackConversationImplCopyWith<_$FeedbackConversationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

FeedbackMessage _$FeedbackMessageFromJson(Map<String, dynamic> json) {
  return _FeedbackMessage.fromJson(json);
}

/// @nodoc
mixin _$FeedbackMessage {
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String? get authorName => throw _privateConstructorUsedError;
  String? get messageText => throw _privateConstructorUsedError;
  bool get isFromTeam => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FeedbackMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackMessageCopyWith<FeedbackMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackMessageCopyWith<$Res> {
  factory $FeedbackMessageCopyWith(
          FeedbackMessage value, $Res Function(FeedbackMessage) then) =
      _$FeedbackMessageCopyWithImpl<$Res, FeedbackMessage>;
  @useResult
  $Res call(
      {String id,
      String authorId,
      String? authorName,
      String? messageText,
      bool isFromTeam,
      DateTime createdAt});
}

/// @nodoc
class _$FeedbackMessageCopyWithImpl<$Res, $Val extends FeedbackMessage>
    implements $FeedbackMessageCopyWith<$Res> {
  _$FeedbackMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = freezed,
    Object? messageText = freezed,
    Object? isFromTeam = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      isFromTeam: null == isFromTeam
          ? _value.isFromTeam
          : isFromTeam // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackMessageImplCopyWith<$Res>
    implements $FeedbackMessageCopyWith<$Res> {
  factory _$$FeedbackMessageImplCopyWith(_$FeedbackMessageImpl value,
          $Res Function(_$FeedbackMessageImpl) then) =
      __$$FeedbackMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String authorId,
      String? authorName,
      String? messageText,
      bool isFromTeam,
      DateTime createdAt});
}

/// @nodoc
class __$$FeedbackMessageImplCopyWithImpl<$Res>
    extends _$FeedbackMessageCopyWithImpl<$Res, _$FeedbackMessageImpl>
    implements _$$FeedbackMessageImplCopyWith<$Res> {
  __$$FeedbackMessageImplCopyWithImpl(
      _$FeedbackMessageImpl _value, $Res Function(_$FeedbackMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? authorName = freezed,
    Object? messageText = freezed,
    Object? isFromTeam = null,
    Object? createdAt = null,
  }) {
    return _then(_$FeedbackMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      messageText: freezed == messageText
          ? _value.messageText
          : messageText // ignore: cast_nullable_to_non_nullable
              as String?,
      isFromTeam: null == isFromTeam
          ? _value.isFromTeam
          : isFromTeam // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackMessageImpl extends _FeedbackMessage {
  const _$FeedbackMessageImpl(
      {required this.id,
      required this.authorId,
      this.authorName,
      this.messageText = '',
      this.isFromTeam = false,
      required this.createdAt})
      : super._();

  factory _$FeedbackMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String authorId;
  @override
  final String? authorName;
  @override
  @JsonKey()
  final String? messageText;
  @override
  @JsonKey()
  final bool isFromTeam;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'FeedbackMessage(id: $id, authorId: $authorId, authorName: $authorName, messageText: $messageText, isFromTeam: $isFromTeam, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.messageText, messageText) ||
                other.messageText == messageText) &&
            (identical(other.isFromTeam, isFromTeam) ||
                other.isFromTeam == isFromTeam) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, authorId, authorName,
      messageText, isFromTeam, createdAt);

  /// Create a copy of FeedbackMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackMessageImplCopyWith<_$FeedbackMessageImpl> get copyWith =>
      __$$FeedbackMessageImplCopyWithImpl<_$FeedbackMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackMessageImplToJson(
      this,
    );
  }
}

abstract class _FeedbackMessage extends FeedbackMessage {
  const factory _FeedbackMessage(
      {required final String id,
      required final String authorId,
      final String? authorName,
      final String? messageText,
      final bool isFromTeam,
      required final DateTime createdAt}) = _$FeedbackMessageImpl;
  const _FeedbackMessage._() : super._();

  factory _FeedbackMessage.fromJson(Map<String, dynamic> json) =
      _$FeedbackMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get authorId;
  @override
  String? get authorName;
  @override
  String? get messageText;
  @override
  bool get isFromTeam;
  @override
  DateTime get createdAt;

  /// Create a copy of FeedbackMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackMessageImplCopyWith<_$FeedbackMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
