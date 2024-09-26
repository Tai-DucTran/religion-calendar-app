// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_date_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventDateTime _$EventDateTimeFromJson(Map<String, dynamic> json) {
  return _EventDateTime.fromJson(json);
}

/// @nodoc
mixin _$EventDateTime {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Serializes this EventDateTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventDateTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDateTimeCopyWith<EventDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDateTimeCopyWith<$Res> {
  factory $EventDateTimeCopyWith(
          EventDateTime value, $Res Function(EventDateTime) then) =
      _$EventDateTimeCopyWithImpl<$Res, EventDateTime>;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime? startTime,
      DateTime endDate,
      DateTime? endTime});
}

/// @nodoc
class _$EventDateTimeCopyWithImpl<$Res, $Val extends EventDateTime>
    implements $EventDateTimeCopyWith<$Res> {
  _$EventDateTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDateTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? startTime = freezed,
    Object? endDate = null,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventDateTimeImplCopyWith<$Res>
    implements $EventDateTimeCopyWith<$Res> {
  factory _$$EventDateTimeImplCopyWith(
          _$EventDateTimeImpl value, $Res Function(_$EventDateTimeImpl) then) =
      __$$EventDateTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime? startTime,
      DateTime endDate,
      DateTime? endTime});
}

/// @nodoc
class __$$EventDateTimeImplCopyWithImpl<$Res>
    extends _$EventDateTimeCopyWithImpl<$Res, _$EventDateTimeImpl>
    implements _$$EventDateTimeImplCopyWith<$Res> {
  __$$EventDateTimeImplCopyWithImpl(
      _$EventDateTimeImpl _value, $Res Function(_$EventDateTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDateTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? startTime = freezed,
    Object? endDate = null,
    Object? endTime = freezed,
  }) {
    return _then(_$EventDateTimeImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDateTimeImpl extends _EventDateTime {
  const _$EventDateTimeImpl(
      {required this.startDate,
      required this.startTime,
      required this.endDate,
      required this.endTime})
      : super._();

  factory _$EventDateTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDateTimeImplFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime? startTime;
  @override
  final DateTime endDate;
  @override
  final DateTime? endTime;

  @override
  String toString() {
    return 'EventDateTime(startDate: $startDate, startTime: $startTime, endDate: $endDate, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDateTimeImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startDate, startTime, endDate, endTime);

  /// Create a copy of EventDateTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDateTimeImplCopyWith<_$EventDateTimeImpl> get copyWith =>
      __$$EventDateTimeImplCopyWithImpl<_$EventDateTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDateTimeImplToJson(
      this,
    );
  }
}

abstract class _EventDateTime extends EventDateTime {
  const factory _EventDateTime(
      {required final DateTime startDate,
      required final DateTime? startTime,
      required final DateTime endDate,
      required final DateTime? endTime}) = _$EventDateTimeImpl;
  const _EventDateTime._() : super._();

  factory _EventDateTime.fromJson(Map<String, dynamic> json) =
      _$EventDateTimeImpl.fromJson;

  @override
  DateTime get startDate;
  @override
  DateTime? get startTime;
  @override
  DateTime get endDate;
  @override
  DateTime? get endTime;

  /// Create a copy of EventDateTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDateTimeImplCopyWith<_$EventDateTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
