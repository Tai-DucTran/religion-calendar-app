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
  String get repeatedFrequencyAt => throw _privateConstructorUsedError;

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
      String repeatedFrequencyAt});
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
    Object? repeatedFrequencyAt = null,
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
      repeatedFrequencyAt: null == repeatedFrequencyAt
          ? _value.repeatedFrequencyAt
          : repeatedFrequencyAt // ignore: cast_nullable_to_non_nullable
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
      String repeatedFrequencyAt});
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
    Object? repeatedFrequencyAt = null,
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
      repeatedFrequencyAt: null == repeatedFrequencyAt
          ? _value.repeatedFrequencyAt
          : repeatedFrequencyAt // ignore: cast_nullable_to_non_nullable
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
      required this.repeatedFrequencyAt})
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
  final String repeatedFrequencyAt;

  @override
  String toString() {
    return 'UserEvent(id: $id, title: $title, calendarCategory: $calendarCategory, eventCategory: $eventCategory, isAllDay: $isAllDay, startDate: $startDate, endDate: $endDate, location: $location, createdAt: $createdAt, updatedAt: $updatedAt, remindMeBefore: $remindMeBefore, repeatedFrequencyAt: $repeatedFrequencyAt)';
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
            (identical(other.repeatedFrequencyAt, repeatedFrequencyAt) ||
                other.repeatedFrequencyAt == repeatedFrequencyAt));
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
      repeatedFrequencyAt);

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
      required final String repeatedFrequencyAt}) = _$UserEventImpl;
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
  String get repeatedFrequencyAt;

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
  LocalizedDescription get localizedDescription =>
      throw _privateConstructorUsedError;
  int get importantLevel => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  EventCategory get eventCategory => throw _privateConstructorUsedError;
  CalendarCategory get calendarCategory => throw _privateConstructorUsedError;
  double get remindMeBefore => throw _privateConstructorUsedError;
  ReligionPreference get religion => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get img => throw _privateConstructorUsedError;

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
      LocalizedDescription localizedDescription,
      int importantLevel,
      DateTime startDate,
      DateTime endDate,
      EventCategory eventCategory,
      CalendarCategory calendarCategory,
      double remindMeBefore,
      ReligionPreference religion,
      DateTime createdAt,
      DateTime updatedAt,
      String img});

  $LocalizedDescriptionCopyWith<$Res> get localizedDescription;
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
    Object? localizedDescription = null,
    Object? importantLevel = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? eventCategory = null,
    Object? calendarCategory = null,
    Object? remindMeBefore = null,
    Object? religion = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? img = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localizedDescription: null == localizedDescription
          ? _value.localizedDescription
          : localizedDescription // ignore: cast_nullable_to_non_nullable
              as LocalizedDescription,
      importantLevel: null == importantLevel
          ? _value.importantLevel
          : importantLevel // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      calendarCategory: null == calendarCategory
          ? _value.calendarCategory
          : calendarCategory // ignore: cast_nullable_to_non_nullable
              as CalendarCategory,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      religion: null == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as ReligionPreference,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ReligionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDescriptionCopyWith<$Res> get localizedDescription {
    return $LocalizedDescriptionCopyWith<$Res>(_value.localizedDescription,
        (value) {
      return _then(_value.copyWith(localizedDescription: value) as $Val);
    });
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
      LocalizedDescription localizedDescription,
      int importantLevel,
      DateTime startDate,
      DateTime endDate,
      EventCategory eventCategory,
      CalendarCategory calendarCategory,
      double remindMeBefore,
      ReligionPreference religion,
      DateTime createdAt,
      DateTime updatedAt,
      String img});

  @override
  $LocalizedDescriptionCopyWith<$Res> get localizedDescription;
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
    Object? localizedDescription = null,
    Object? importantLevel = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? eventCategory = null,
    Object? calendarCategory = null,
    Object? remindMeBefore = null,
    Object? religion = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? img = null,
  }) {
    return _then(_$ReligionEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      localizedDescription: null == localizedDescription
          ? _value.localizedDescription
          : localizedDescription // ignore: cast_nullable_to_non_nullable
              as LocalizedDescription,
      importantLevel: null == importantLevel
          ? _value.importantLevel
          : importantLevel // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventCategory: null == eventCategory
          ? _value.eventCategory
          : eventCategory // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      calendarCategory: null == calendarCategory
          ? _value.calendarCategory
          : calendarCategory // ignore: cast_nullable_to_non_nullable
              as CalendarCategory,
      remindMeBefore: null == remindMeBefore
          ? _value.remindMeBefore
          : remindMeBefore // ignore: cast_nullable_to_non_nullable
              as double,
      religion: null == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as ReligionPreference,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReligionEventImpl implements _ReligionEvent {
  const _$ReligionEventImpl(
      {required this.id,
      required this.localizedDescription,
      required this.importantLevel,
      required this.startDate,
      required this.endDate,
      required this.eventCategory,
      required this.calendarCategory,
      required this.remindMeBefore,
      required this.religion,
      required this.createdAt,
      required this.updatedAt,
      this.img = ""});

  factory _$ReligionEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReligionEventImplFromJson(json);

  @override
  final String id;
  @override
  final LocalizedDescription localizedDescription;
  @override
  final int importantLevel;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final EventCategory eventCategory;
  @override
  final CalendarCategory calendarCategory;
  @override
  final double remindMeBefore;
  @override
  final ReligionPreference religion;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final String img;

  @override
  String toString() {
    return 'ReligionEvent(id: $id, localizedDescription: $localizedDescription, importantLevel: $importantLevel, startDate: $startDate, endDate: $endDate, eventCategory: $eventCategory, calendarCategory: $calendarCategory, remindMeBefore: $remindMeBefore, religion: $religion, createdAt: $createdAt, updatedAt: $updatedAt, img: $img)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReligionEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.localizedDescription, localizedDescription) ||
                other.localizedDescription == localizedDescription) &&
            (identical(other.importantLevel, importantLevel) ||
                other.importantLevel == importantLevel) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.eventCategory, eventCategory) ||
                other.eventCategory == eventCategory) &&
            (identical(other.calendarCategory, calendarCategory) ||
                other.calendarCategory == calendarCategory) &&
            (identical(other.remindMeBefore, remindMeBefore) ||
                other.remindMeBefore == remindMeBefore) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.img, img) || other.img == img));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      localizedDescription,
      importantLevel,
      startDate,
      endDate,
      eventCategory,
      calendarCategory,
      remindMeBefore,
      religion,
      createdAt,
      updatedAt,
      img);

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

abstract class _ReligionEvent implements ReligionEvent {
  const factory _ReligionEvent(
      {required final String id,
      required final LocalizedDescription localizedDescription,
      required final int importantLevel,
      required final DateTime startDate,
      required final DateTime endDate,
      required final EventCategory eventCategory,
      required final CalendarCategory calendarCategory,
      required final double remindMeBefore,
      required final ReligionPreference religion,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String img}) = _$ReligionEventImpl;

  factory _ReligionEvent.fromJson(Map<String, dynamic> json) =
      _$ReligionEventImpl.fromJson;

  @override
  String get id;
  @override
  LocalizedDescription get localizedDescription;
  @override
  int get importantLevel;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  EventCategory get eventCategory;
  @override
  CalendarCategory get calendarCategory;
  @override
  double get remindMeBefore;
  @override
  ReligionPreference get religion;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String get img;

  /// Create a copy of ReligionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReligionEventImplCopyWith<_$ReligionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalizedDescription _$LocalizedDescriptionFromJson(Map<String, dynamic> json) {
  return _LocalizedDescription.fromJson(json);
}

/// @nodoc
mixin _$LocalizedDescription {
  LocalizedContent get en => throw _privateConstructorUsedError;
  LocalizedContent get vi => throw _privateConstructorUsedError;
  LocalizedContent? get userEvent => throw _privateConstructorUsedError;

  /// Serializes this LocalizedDescription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalizedDescriptionCopyWith<LocalizedDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizedDescriptionCopyWith<$Res> {
  factory $LocalizedDescriptionCopyWith(LocalizedDescription value,
          $Res Function(LocalizedDescription) then) =
      _$LocalizedDescriptionCopyWithImpl<$Res, LocalizedDescription>;
  @useResult
  $Res call(
      {LocalizedContent en, LocalizedContent vi, LocalizedContent? userEvent});

  $LocalizedContentCopyWith<$Res> get en;
  $LocalizedContentCopyWith<$Res> get vi;
  $LocalizedContentCopyWith<$Res>? get userEvent;
}

/// @nodoc
class _$LocalizedDescriptionCopyWithImpl<$Res,
        $Val extends LocalizedDescription>
    implements $LocalizedDescriptionCopyWith<$Res> {
  _$LocalizedDescriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
    Object? vi = null,
    Object? userEvent = freezed,
  }) {
    return _then(_value.copyWith(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as LocalizedContent,
      vi: null == vi
          ? _value.vi
          : vi // ignore: cast_nullable_to_non_nullable
              as LocalizedContent,
      userEvent: freezed == userEvent
          ? _value.userEvent
          : userEvent // ignore: cast_nullable_to_non_nullable
              as LocalizedContent?,
    ) as $Val);
  }

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedContentCopyWith<$Res> get en {
    return $LocalizedContentCopyWith<$Res>(_value.en, (value) {
      return _then(_value.copyWith(en: value) as $Val);
    });
  }

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedContentCopyWith<$Res> get vi {
    return $LocalizedContentCopyWith<$Res>(_value.vi, (value) {
      return _then(_value.copyWith(vi: value) as $Val);
    });
  }

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedContentCopyWith<$Res>? get userEvent {
    if (_value.userEvent == null) {
      return null;
    }

    return $LocalizedContentCopyWith<$Res>(_value.userEvent!, (value) {
      return _then(_value.copyWith(userEvent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalizedDescriptionImplCopyWith<$Res>
    implements $LocalizedDescriptionCopyWith<$Res> {
  factory _$$LocalizedDescriptionImplCopyWith(_$LocalizedDescriptionImpl value,
          $Res Function(_$LocalizedDescriptionImpl) then) =
      __$$LocalizedDescriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LocalizedContent en, LocalizedContent vi, LocalizedContent? userEvent});

  @override
  $LocalizedContentCopyWith<$Res> get en;
  @override
  $LocalizedContentCopyWith<$Res> get vi;
  @override
  $LocalizedContentCopyWith<$Res>? get userEvent;
}

/// @nodoc
class __$$LocalizedDescriptionImplCopyWithImpl<$Res>
    extends _$LocalizedDescriptionCopyWithImpl<$Res, _$LocalizedDescriptionImpl>
    implements _$$LocalizedDescriptionImplCopyWith<$Res> {
  __$$LocalizedDescriptionImplCopyWithImpl(_$LocalizedDescriptionImpl _value,
      $Res Function(_$LocalizedDescriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? en = null,
    Object? vi = null,
    Object? userEvent = freezed,
  }) {
    return _then(_$LocalizedDescriptionImpl(
      en: null == en
          ? _value.en
          : en // ignore: cast_nullable_to_non_nullable
              as LocalizedContent,
      vi: null == vi
          ? _value.vi
          : vi // ignore: cast_nullable_to_non_nullable
              as LocalizedContent,
      userEvent: freezed == userEvent
          ? _value.userEvent
          : userEvent // ignore: cast_nullable_to_non_nullable
              as LocalizedContent?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizedDescriptionImpl implements _LocalizedDescription {
  const _$LocalizedDescriptionImpl(
      {required this.en, required this.vi, this.userEvent});

  factory _$LocalizedDescriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizedDescriptionImplFromJson(json);

  @override
  final LocalizedContent en;
  @override
  final LocalizedContent vi;
  @override
  final LocalizedContent? userEvent;

  @override
  String toString() {
    return 'LocalizedDescription(en: $en, vi: $vi, userEvent: $userEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizedDescriptionImpl &&
            (identical(other.en, en) || other.en == en) &&
            (identical(other.vi, vi) || other.vi == vi) &&
            (identical(other.userEvent, userEvent) ||
                other.userEvent == userEvent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, en, vi, userEvent);

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizedDescriptionImplCopyWith<_$LocalizedDescriptionImpl>
      get copyWith =>
          __$$LocalizedDescriptionImplCopyWithImpl<_$LocalizedDescriptionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizedDescriptionImplToJson(
      this,
    );
  }
}

abstract class _LocalizedDescription implements LocalizedDescription {
  const factory _LocalizedDescription(
      {required final LocalizedContent en,
      required final LocalizedContent vi,
      final LocalizedContent? userEvent}) = _$LocalizedDescriptionImpl;

  factory _LocalizedDescription.fromJson(Map<String, dynamic> json) =
      _$LocalizedDescriptionImpl.fromJson;

  @override
  LocalizedContent get en;
  @override
  LocalizedContent get vi;
  @override
  LocalizedContent? get userEvent;

  /// Create a copy of LocalizedDescription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizedDescriptionImplCopyWith<_$LocalizedDescriptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LocalizedContent _$LocalizedContentFromJson(Map<String, dynamic> json) {
  return _LocalizedContent.fromJson(json);
}

/// @nodoc
mixin _$LocalizedContent {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this LocalizedContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalizedContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalizedContentCopyWith<LocalizedContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizedContentCopyWith<$Res> {
  factory $LocalizedContentCopyWith(
          LocalizedContent value, $Res Function(LocalizedContent) then) =
      _$LocalizedContentCopyWithImpl<$Res, LocalizedContent>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$LocalizedContentCopyWithImpl<$Res, $Val extends LocalizedContent>
    implements $LocalizedContentCopyWith<$Res> {
  _$LocalizedContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalizedContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizedContentImplCopyWith<$Res>
    implements $LocalizedContentCopyWith<$Res> {
  factory _$$LocalizedContentImplCopyWith(_$LocalizedContentImpl value,
          $Res Function(_$LocalizedContentImpl) then) =
      __$$LocalizedContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$LocalizedContentImplCopyWithImpl<$Res>
    extends _$LocalizedContentCopyWithImpl<$Res, _$LocalizedContentImpl>
    implements _$$LocalizedContentImplCopyWith<$Res> {
  __$$LocalizedContentImplCopyWithImpl(_$LocalizedContentImpl _value,
      $Res Function(_$LocalizedContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalizedContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$LocalizedContentImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalizedContentImpl implements _LocalizedContent {
  const _$LocalizedContentImpl(
      {required this.title, required this.description});

  factory _$LocalizedContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalizedContentImplFromJson(json);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'LocalizedContent(title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizedContentImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  /// Create a copy of LocalizedContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizedContentImplCopyWith<_$LocalizedContentImpl> get copyWith =>
      __$$LocalizedContentImplCopyWithImpl<_$LocalizedContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalizedContentImplToJson(
      this,
    );
  }
}

abstract class _LocalizedContent implements LocalizedContent {
  const factory _LocalizedContent(
      {required final String title,
      required final String description}) = _$LocalizedContentImpl;

  factory _LocalizedContent.fromJson(Map<String, dynamic> json) =
      _$LocalizedContentImpl.fromJson;

  @override
  String get title;
  @override
  String get description;

  /// Create a copy of LocalizedContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizedContentImplCopyWith<_$LocalizedContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BasedEvent _$BasedEventFromJson(Map<String, dynamic> json) {
  return _BasedEvent.fromJson(json);
}

/// @nodoc
mixin _$BasedEvent {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  CalendarCategory get calendarCategory => throw _privateConstructorUsedError;
  EventCategory get eventCategory => throw _privateConstructorUsedError;
  bool get isAllDay => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  double get remindMeBefore => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get importantLevel => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get repeatedFrequencyAt => throw _privateConstructorUsedError;

  /// Serializes this BasedEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasedEventCopyWith<BasedEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasedEventCopyWith<$Res> {
  factory $BasedEventCopyWith(
          BasedEvent value, $Res Function(BasedEvent) then) =
      _$BasedEventCopyWithImpl<$Res, BasedEvent>;
  @useResult
  $Res call(
      {String id,
      String title,
      CalendarCategory calendarCategory,
      EventCategory eventCategory,
      bool isAllDay,
      DateTime startDate,
      DateTime endDate,
      DateTime createdAt,
      DateTime updatedAt,
      double remindMeBefore,
      String? img,
      String? description,
      int? importantLevel,
      String? location,
      String? repeatedFrequencyAt});
}

/// @nodoc
class _$BasedEventCopyWithImpl<$Res, $Val extends BasedEvent>
    implements $BasedEventCopyWith<$Res> {
  _$BasedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasedEvent
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
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? remindMeBefore = null,
    Object? img = freezed,
    Object? description = freezed,
    Object? importantLevel = freezed,
    Object? location = freezed,
    Object? repeatedFrequencyAt = freezed,
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
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      importantLevel: freezed == importantLevel
          ? _value.importantLevel
          : importantLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatedFrequencyAt: freezed == repeatedFrequencyAt
          ? _value.repeatedFrequencyAt
          : repeatedFrequencyAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasedEventImplCopyWith<$Res>
    implements $BasedEventCopyWith<$Res> {
  factory _$$BasedEventImplCopyWith(
          _$BasedEventImpl value, $Res Function(_$BasedEventImpl) then) =
      __$$BasedEventImplCopyWithImpl<$Res>;
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
      DateTime createdAt,
      DateTime updatedAt,
      double remindMeBefore,
      String? img,
      String? description,
      int? importantLevel,
      String? location,
      String? repeatedFrequencyAt});
}

/// @nodoc
class __$$BasedEventImplCopyWithImpl<$Res>
    extends _$BasedEventCopyWithImpl<$Res, _$BasedEventImpl>
    implements _$$BasedEventImplCopyWith<$Res> {
  __$$BasedEventImplCopyWithImpl(
      _$BasedEventImpl _value, $Res Function(_$BasedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BasedEvent
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
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? remindMeBefore = null,
    Object? img = freezed,
    Object? description = freezed,
    Object? importantLevel = freezed,
    Object? location = freezed,
    Object? repeatedFrequencyAt = freezed,
  }) {
    return _then(_$BasedEventImpl(
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
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      importantLevel: freezed == importantLevel
          ? _value.importantLevel
          : importantLevel // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatedFrequencyAt: freezed == repeatedFrequencyAt
          ? _value.repeatedFrequencyAt
          : repeatedFrequencyAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BasedEventImpl extends _BasedEvent {
  const _$BasedEventImpl(
      {required this.id,
      required this.title,
      required this.calendarCategory,
      required this.eventCategory,
      this.isAllDay = false,
      required this.startDate,
      required this.endDate,
      required this.createdAt,
      required this.updatedAt,
      required this.remindMeBefore,
      this.img,
      this.description,
      this.importantLevel,
      this.location,
      this.repeatedFrequencyAt})
      : super._();

  factory _$BasedEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasedEventImplFromJson(json);

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
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final double remindMeBefore;
  @override
  final String? img;
  @override
  final String? description;
  @override
  final int? importantLevel;
  @override
  final String? location;
  @override
  final String? repeatedFrequencyAt;

  @override
  String toString() {
    return 'BasedEvent(id: $id, title: $title, calendarCategory: $calendarCategory, eventCategory: $eventCategory, isAllDay: $isAllDay, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, remindMeBefore: $remindMeBefore, img: $img, description: $description, importantLevel: $importantLevel, location: $location, repeatedFrequencyAt: $repeatedFrequencyAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasedEventImpl &&
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
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.remindMeBefore, remindMeBefore) ||
                other.remindMeBefore == remindMeBefore) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.importantLevel, importantLevel) ||
                other.importantLevel == importantLevel) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.repeatedFrequencyAt, repeatedFrequencyAt) ||
                other.repeatedFrequencyAt == repeatedFrequencyAt));
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
      createdAt,
      updatedAt,
      remindMeBefore,
      img,
      description,
      importantLevel,
      location,
      repeatedFrequencyAt);

  /// Create a copy of BasedEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasedEventImplCopyWith<_$BasedEventImpl> get copyWith =>
      __$$BasedEventImplCopyWithImpl<_$BasedEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasedEventImplToJson(
      this,
    );
  }
}

abstract class _BasedEvent extends BasedEvent {
  const factory _BasedEvent(
      {required final String id,
      required final String title,
      required final CalendarCategory calendarCategory,
      required final EventCategory eventCategory,
      final bool isAllDay,
      required final DateTime startDate,
      required final DateTime endDate,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final double remindMeBefore,
      final String? img,
      final String? description,
      final int? importantLevel,
      final String? location,
      final String? repeatedFrequencyAt}) = _$BasedEventImpl;
  const _BasedEvent._() : super._();

  factory _BasedEvent.fromJson(Map<String, dynamic> json) =
      _$BasedEventImpl.fromJson;

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
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  double get remindMeBefore;
  @override
  String? get img;
  @override
  String? get description;
  @override
  int? get importantLevel;
  @override
  String? get location;
  @override
  String? get repeatedFrequencyAt;

  /// Create a copy of BasedEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasedEventImplCopyWith<_$BasedEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
