// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

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
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  CalendarCategory get calendarCategory => throw _privateConstructorUsedError;
  EventCategory get eventCategory => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  double get remindMeBefore => throw _privateConstructorUsedError;
  String get repeatFrequencyAt => throw _privateConstructorUsedError;

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
      {String id,
      String title,
      CalendarCategory calendarCategory,
      EventCategory eventCategory,
      bool isAllDay,
      DateTime startDate,
      DateTime endDate,
      String location,
      DateTime createdAt,
      DateTime updatedAt,
      double remindMeBefore,
      String repeatFrequencyAt});
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
    Object? id = null,
    Object? title = null,
    Object? calendarCategory = null,
    Object? eventCategory = null,
    Object? isAllDay = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? remindMeBefore = null,
    Object? repeatFrequencyAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      calendarCategory: null == calendarCategory
          ? _value.calendarCategory
          : calendarCategory // ignore: cast_nullable_to_non_nullable
              as CalendarCategory,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      repeatFrequencyAt: null == repeatFrequencyAt
          ? _value.repeatFrequencyAt
          : repeatFrequencyAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String id,
      String title,
      CalendarCategory calendarCategory,
      EventCategory eventCategory,
      bool isAllDay,
      DateTime startDate,
      DateTime endDate,
      String location,
      DateTime createdAt,
      DateTime updatedAt,
      double remindMeBefore,
      String repeatFrequencyAt});
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
    Object? id = null,
    Object? title = null,
    Object? calendarCategory = null,
    Object? eventCategory = null,
    Object? isAllDay = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? location = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? remindMeBefore = null,
    Object? repeatFrequencyAt = null,
  }) {
    return _then(_$UserEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      calendarCategory: null == calendarCategory
          ? _value.calendarCategory
          : calendarCategory // ignore: cast_nullable_to_non_nullable
              as CalendarCategory,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      isAllDay: null == isAllDay
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      repeatFrequencyAt: null == repeatFrequencyAt
          ? _value.repeatFrequencyAt
          : repeatFrequencyAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEventImpl extends _UserEvent {
  const _$UserEventImpl(
      {required this.id,
      required this.title,
      required this.calendarCategory,
      required this.eventCategory,
      this.isAllDay = false,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.createdAt,
      required this.updatedAt,
      required this.remindMeBefore,
      required this.repeatFrequencyAt})
      : super._();

  factory _$UserEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEventImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final CalendarCategory calendarCategory;
  @override
  final EventCategory eventCategory;
  @override
  @JsonKey()
  final bool isAllDay;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String location;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final double remindMeBefore;
  @override
  final String repeatFrequencyAt;

  @override
  String toString() {
    return 'UserEvent(id: $id, title: $title, calendarCategory: $calendarCategory, eventCategory: $eventCategory, isAllDay: $isAllDay, startDate: $startDate, endDate: $endDate, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, remindMeBefore: $remindMeBefore, repeatFrequencyAt: $repeatFrequencyAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.calendarCategory, calendarCategory) ||
                other.calendarCategory == calendarCategory) &&
            (identical(other.eventCategory, eventCategory) ||
                other.eventCategory == eventCategory) &&
            (identical(other.isAllDay, isAllDay) ||
                other.isAllDay == isAllDay) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.remindMeBefore, remindMeBefore) ||
                other.remindMeBefore == remindMeBefore) &&
            (identical(other.repeatFrequencyAt, repeatFrequencyAt) ||
                other.repeatFrequencyAt == repeatFrequencyAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      calendarCategory,
      eventCategory,
      isAllDay,
      startDate,
      endDate,
      location,
      createdAt,
      updatedAt,
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
      {required final String id,
      required final String title,
      required final CalendarCategory calendarCategory,
      required final EventCategory eventCategory,
      final bool isAllDay,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String location,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final double remindMeBefore,
      required final String repeatFrequencyAt}) = _$UserEventImpl;
  const _UserEvent._() : super._();

  factory _UserEvent.fromJson(Map<String, dynamic> json) =
      _$UserEventImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  CalendarCategory get calendarCategory;
  @override
  EventCategory get eventCategory;
  @override
  bool get isAllDay;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get location;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  double get remindMeBefore;
  @override
  String get repeatFrequencyAt;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserEventImplCopyWith<_$UserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReligionEvent _$ReligionEventFromJson(Map<String, dynamic> json) {
  return _ReligionEvent.fromJson(json);
}

/// @nodoc
mixin _$ReligionEvent {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  ReligionPreference get religion => throw _privateConstructorUsedError;
  EventCategory get eventCategory => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  double get remindMeBefore => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ImportantLevel get level => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ReligionEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReligionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReligionEventCopyWith<ReligionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReligionEventCopyWith<$Res> {
  factory $ReligionEventCopyWith(
          ReligionEvent value, $Res Function(ReligionEvent) then) =
      _$ReligionEventCopyWithImpl<$Res, ReligionEvent>;
  @useResult
  $Res call(
      {String id,
      String title,
      ReligionPreference religion,
      EventCategory eventCategory,
      DateTime startDate,
      DateTime endDate,
      double remindMeBefore,
      String description,
      ImportantLevel level,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ReligionEventCopyWithImpl<$Res, $Val extends ReligionEvent>
    implements $ReligionEventCopyWith<$Res> {
  _$ReligionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReligionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? religion = null,
    Object? eventCategory = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? remindMeBefore = null,
    Object? description = null,
    Object? level = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      religion: null == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as ReligionPreference,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as ImportantLevel,
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
abstract class _$$ReligionEventImplCopyWith<$Res>
    implements $ReligionEventCopyWith<$Res> {
  factory _$$ReligionEventImplCopyWith(
          _$ReligionEventImpl value, $Res Function(_$ReligionEventImpl) then) =
      __$$ReligionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      ReligionPreference religion,
      EventCategory eventCategory,
      DateTime startDate,
      DateTime endDate,
      double remindMeBefore,
      String description,
      ImportantLevel level,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$ReligionEventImplCopyWithImpl<$Res>
    extends _$ReligionEventCopyWithImpl<$Res, _$ReligionEventImpl>
    implements _$$ReligionEventImplCopyWith<$Res> {
  __$$ReligionEventImplCopyWithImpl(
      _$ReligionEventImpl _value, $Res Function(_$ReligionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReligionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? religion = null,
    Object? eventCategory = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? remindMeBefore = null,
    Object? description = null,
    Object? level = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ReligionEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      religion: null == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as ReligionPreference,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as ImportantLevel,
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
class _$ReligionEventImpl extends _ReligionEvent {
  const _$ReligionEventImpl(
      {required this.id,
      required this.title,
      required this.religion,
      this.eventCategory = EventCategory.religionEvent,
      required this.startDate,
      required this.endDate,
      required this.remindMeBefore,
      required this.description,
      required this.level,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$ReligionEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReligionEventImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final ReligionPreference religion;
  @override
  @JsonKey()
  final EventCategory eventCategory;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final double remindMeBefore;
  @override
  final String description;
  @override
  final ImportantLevel level;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ReligionEvent(id: $id, title: $title, religion: $religion, eventCategory: $eventCategory, startDate: $startDate, endDate: $endDate, remindMeBefore: $remindMeBefore, description: $description, level: $level, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReligionEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            (identical(other.eventCategory, eventCategory) ||
                other.eventCategory == eventCategory) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.remindMeBefore, remindMeBefore) ||
                other.remindMeBefore == remindMeBefore) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.level, level) || other.level == level) &&
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
      title,
      religion,
      eventCategory,
      startDate,
      endDate,
      remindMeBefore,
      description,
      level,
      createdAt,
      updatedAt);

  /// Create a copy of ReligionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReligionEventImplCopyWith<_$ReligionEventImpl> get copyWith =>
      __$$ReligionEventImplCopyWithImpl<_$ReligionEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReligionEventImplToJson(
      this,
    );
  }
}

abstract class _ReligionEvent extends ReligionEvent {
  const factory _ReligionEvent(
      {required final String id,
      required final String title,
      required final ReligionPreference religion,
      final EventCategory eventCategory,
      required final DateTime startDate,
      required final DateTime endDate,
      required final double remindMeBefore,
      required final String description,
      required final ImportantLevel level,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$ReligionEventImpl;
  const _ReligionEvent._() : super._();

  factory _ReligionEvent.fromJson(Map<String, dynamic> json) =
      _$ReligionEventImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  ReligionPreference get religion;
  @override
  EventCategory get eventCategory;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  double get remindMeBefore;
  @override
  String get description;
  @override
  ImportantLevel get level;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of ReligionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReligionEventImplCopyWith<_$ReligionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
