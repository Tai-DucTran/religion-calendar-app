// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserEvent _$UserEventFromJson(Map<String, dynamic> json) {
  return _UserEvent.fromJson(json);
}

/// @nodoc
mixin _$UserEvent {
  String get userId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get eventName => throw _privateConstructorUsedError;
  EventCategory get eventCategory => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;
  DateTime get startingDate => throw _privateConstructorUsedError;
  DateTime get endingDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get remindMeBefore => throw _privateConstructorUsedError;
  RepeatFrequency get repeatFrequencyAt => throw _privateConstructorUsedError;

  /// Serializes this UserEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserEventCopyWith<UserEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
  @useResult
  $Res call(
      {String userId,
      String eventId,
      String eventName,
      EventCategory eventCategory,
      bool isAllDay,
      DateTime startingDate,
      DateTime endingDate,
      String location,
      double remindMeBefore,
      RepeatFrequency repeatFrequencyAt});
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? eventId = null,
    Object? eventName = null,
    Object? eventCategory = null,
    Object? isAllDay = null,
    Object? startingDate = null,
    Object? endingDate = null,
    Object? location = null,
    Object? remindMeBefore = null,
    Object? repeatFrequencyAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startingDate: null == startingDate
          ? _value.startingDate
          : startingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endingDate: null == endingDate
          ? _value.endingDate
          : endingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      repeatFrequencyAt: null == repeatFrequencyAt
          ? _value.repeatFrequencyAt
          : repeatFrequencyAt // ignore: cast_nullable_to_non_nullable
              as RepeatFrequency,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEventImplCopyWith<$Res>
    implements $UserEventCopyWith<$Res> {
  factory _$$UserEventImplCopyWith(
          _$UserEventImpl value, $Res Function(_$UserEventImpl) then) =
      __$$UserEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String eventId,
      String eventName,
      EventCategory eventCategory,
      bool isAllDay,
      DateTime startingDate,
      DateTime endingDate,
      String location,
      double remindMeBefore,
      RepeatFrequency repeatFrequencyAt});
}

/// @nodoc
class __$$UserEventImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserEventImpl>
    implements _$$UserEventImplCopyWith<$Res> {
  __$$UserEventImplCopyWithImpl(
      _$UserEventImpl _value, $Res Function(_$UserEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? eventId = null,
    Object? eventName = null,
    Object? eventCategory = null,
    Object? isAllDay = null,
    Object? startingDate = null,
    Object? endingDate = null,
    Object? location = null,
    Object? remindMeBefore = null,
    Object? repeatFrequencyAt = null,
  }) {
    return _then(_$UserEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventName: null == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startingDate: null == startingDate
          ? _value.startingDate
          : startingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endingDate: null == endingDate
          ? _value.endingDate
          : endingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      repeatFrequencyAt: null == repeatFrequencyAt
          ? _value.repeatFrequencyAt
          : repeatFrequencyAt // ignore: cast_nullable_to_non_nullable
              as RepeatFrequency,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEventImpl extends _UserEvent {
  const _$UserEventImpl(
      {required this.userId,
      required this.eventId,
      required this.eventName,
      required this.eventCategory,
      required this.isAllDay,
      required this.startingDate,
      required this.endingDate,
      required this.location,
      required this.remindMeBefore,
      required this.repeatFrequencyAt})
      : super._();

  factory _$UserEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEventImplFromJson(json);

  @override
  final String userId;
  @override
  final String eventId;
  @override
  final String eventName;
  @override
  final EventCategory eventCategory;
  @override
  final bool isAllDay;
  @override
  final DateTime startingDate;
  @override
  final DateTime endingDate;
  @override
  final String location;
  @override
  final double remindMeBefore;
  @override
  final RepeatFrequency repeatFrequencyAt;

  @override
  String toString() {
    return 'UserEvent(userId: $userId, eventId: $eventId, eventName: $eventName, eventCategory: $eventCategory, isAllDay: $isAllDay, startingDate: $startingDate, endingDate: $endingDate, location: $location, remindMeBefore: $remindMeBefore, repeatFrequencyAt: $repeatFrequencyAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventCategory, eventCategory) ||
                other.eventCategory == eventCategory) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.startingDate, startingDate) ||
                other.startingDate == startingDate) &&
            (identical(other.endingDate, endingDate) ||
                other.endingDate == endingDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.remindMeBefore, remindMeBefore) ||
                other.remindMeBefore == remindMeBefore) &&
            (identical(other.repeatFrequencyAt, repeatFrequencyAt) ||
                other.repeatFrequencyAt == repeatFrequencyAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      eventId,
      eventName,
      eventCategory,
      isAllDay,
      startingDate,
      endingDate,
      location,
      remindMeBefore,
      repeatFrequencyAt);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEventImplCopyWith<_$UserEventImpl> get copyWith =>
      __$$UserEventImplCopyWithImpl<_$UserEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEventImplToJson(
      this,
    );
  }
}

abstract class _UserEvent extends UserEvent {
  const factory _UserEvent(
      {required final String userId,
      required final String eventId,
      required final String eventName,
      required final EventCategory eventCategory,
      required final bool isAllDay,
      required final DateTime startingDate,
      required final DateTime endingDate,
      required final String location,
      required final double remindMeBefore,
      required final RepeatFrequency repeatFrequencyAt}) = _$UserEventImpl;
  const _UserEvent._() : super._();

  factory _UserEvent.fromJson(Map<String, dynamic> json) =
      _$UserEventImpl.fromJson;

  @override
  String get userId;
  @override
  String get eventId;
  @override
  String get eventName;
  @override
  EventCategory get eventCategory;
  @override
  bool get isAllDay;
  @override
  DateTime get startingDate;
  @override
  DateTime get endingDate;
  @override
  String get location;
  @override
  double get remindMeBefore;
  @override
  RepeatFrequency get repeatFrequencyAt;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEventImplCopyWith<_$UserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
