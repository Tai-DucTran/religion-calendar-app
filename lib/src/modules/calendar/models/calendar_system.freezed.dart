// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_system.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarSystem {
  int get defaultTimeZone => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int defaultTimeZone) solar,
    required TResult Function(int defaultTimeZone) lunar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int defaultTimeZone)? solar,
    TResult? Function(int defaultTimeZone)? lunar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int defaultTimeZone)? solar,
    TResult Function(int defaultTimeZone)? lunar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SolarCalendarSystem value) solar,
    required TResult Function(LunarCalendarSystem value) lunar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SolarCalendarSystem value)? solar,
    TResult? Function(LunarCalendarSystem value)? lunar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SolarCalendarSystem value)? solar,
    TResult Function(LunarCalendarSystem value)? lunar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarSystemCopyWith<CalendarSystem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarSystemCopyWith<$Res> {
  factory $CalendarSystemCopyWith(
          CalendarSystem value, $Res Function(CalendarSystem) then) =
      _$CalendarSystemCopyWithImpl<$Res, CalendarSystem>;
  @useResult
  $Res call({int defaultTimeZone});
}

/// @nodoc
class _$CalendarSystemCopyWithImpl<$Res, $Val extends CalendarSystem>
    implements $CalendarSystemCopyWith<$Res> {
  _$CalendarSystemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultTimeZone = null,
  }) {
    return _then(_value.copyWith(
      defaultTimeZone: null == defaultTimeZone
          ? _value.defaultTimeZone
          : defaultTimeZone // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolarCalendarSystemImplCopyWith<$Res>
    implements $CalendarSystemCopyWith<$Res> {
  factory _$$SolarCalendarSystemImplCopyWith(_$SolarCalendarSystemImpl value,
          $Res Function(_$SolarCalendarSystemImpl) then) =
      __$$SolarCalendarSystemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int defaultTimeZone});
}

/// @nodoc
class __$$SolarCalendarSystemImplCopyWithImpl<$Res>
    extends _$CalendarSystemCopyWithImpl<$Res, _$SolarCalendarSystemImpl>
    implements _$$SolarCalendarSystemImplCopyWith<$Res> {
  __$$SolarCalendarSystemImplCopyWithImpl(_$SolarCalendarSystemImpl _value,
      $Res Function(_$SolarCalendarSystemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultTimeZone = null,
  }) {
    return _then(_$SolarCalendarSystemImpl(
      defaultTimeZone: null == defaultTimeZone
          ? _value.defaultTimeZone
          : defaultTimeZone // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SolarCalendarSystemImpl extends SolarCalendarSystem {
  const _$SolarCalendarSystemImpl({this.defaultTimeZone = 7}) : super._();

  @override
  @JsonKey()
  final int defaultTimeZone;

  @override
  String toString() {
    return 'CalendarSystem.solar(defaultTimeZone: $defaultTimeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SolarCalendarSystemImpl &&
            (identical(other.defaultTimeZone, defaultTimeZone) ||
                other.defaultTimeZone == defaultTimeZone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, defaultTimeZone);

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SolarCalendarSystemImplCopyWith<_$SolarCalendarSystemImpl> get copyWith =>
      __$$SolarCalendarSystemImplCopyWithImpl<_$SolarCalendarSystemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int defaultTimeZone) solar,
    required TResult Function(int defaultTimeZone) lunar,
  }) {
    return solar(defaultTimeZone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int defaultTimeZone)? solar,
    TResult? Function(int defaultTimeZone)? lunar,
  }) {
    return solar?.call(defaultTimeZone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int defaultTimeZone)? solar,
    TResult Function(int defaultTimeZone)? lunar,
    required TResult orElse(),
  }) {
    if (solar != null) {
      return solar(defaultTimeZone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SolarCalendarSystem value) solar,
    required TResult Function(LunarCalendarSystem value) lunar,
  }) {
    return solar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SolarCalendarSystem value)? solar,
    TResult? Function(LunarCalendarSystem value)? lunar,
  }) {
    return solar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SolarCalendarSystem value)? solar,
    TResult Function(LunarCalendarSystem value)? lunar,
    required TResult orElse(),
  }) {
    if (solar != null) {
      return solar(this);
    }
    return orElse();
  }
}

abstract class SolarCalendarSystem extends CalendarSystem {
  const factory SolarCalendarSystem({final int defaultTimeZone}) =
      _$SolarCalendarSystemImpl;
  const SolarCalendarSystem._() : super._();

  @override
  int get defaultTimeZone;

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SolarCalendarSystemImplCopyWith<_$SolarCalendarSystemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LunarCalendarSystemImplCopyWith<$Res>
    implements $CalendarSystemCopyWith<$Res> {
  factory _$$LunarCalendarSystemImplCopyWith(_$LunarCalendarSystemImpl value,
          $Res Function(_$LunarCalendarSystemImpl) then) =
      __$$LunarCalendarSystemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int defaultTimeZone});
}

/// @nodoc
class __$$LunarCalendarSystemImplCopyWithImpl<$Res>
    extends _$CalendarSystemCopyWithImpl<$Res, _$LunarCalendarSystemImpl>
    implements _$$LunarCalendarSystemImplCopyWith<$Res> {
  __$$LunarCalendarSystemImplCopyWithImpl(_$LunarCalendarSystemImpl _value,
      $Res Function(_$LunarCalendarSystemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultTimeZone = null,
  }) {
    return _then(_$LunarCalendarSystemImpl(
      defaultTimeZone: null == defaultTimeZone
          ? _value.defaultTimeZone
          : defaultTimeZone // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LunarCalendarSystemImpl extends LunarCalendarSystem {
  const _$LunarCalendarSystemImpl({this.defaultTimeZone = 7}) : super._();

  @override
  @JsonKey()
  final int defaultTimeZone;

  @override
  String toString() {
    return 'CalendarSystem.lunar(defaultTimeZone: $defaultTimeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LunarCalendarSystemImpl &&
            (identical(other.defaultTimeZone, defaultTimeZone) ||
                other.defaultTimeZone == defaultTimeZone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, defaultTimeZone);

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LunarCalendarSystemImplCopyWith<_$LunarCalendarSystemImpl> get copyWith =>
      __$$LunarCalendarSystemImplCopyWithImpl<_$LunarCalendarSystemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int defaultTimeZone) solar,
    required TResult Function(int defaultTimeZone) lunar,
  }) {
    return lunar(defaultTimeZone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int defaultTimeZone)? solar,
    TResult? Function(int defaultTimeZone)? lunar,
  }) {
    return lunar?.call(defaultTimeZone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int defaultTimeZone)? solar,
    TResult Function(int defaultTimeZone)? lunar,
    required TResult orElse(),
  }) {
    if (lunar != null) {
      return lunar(defaultTimeZone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SolarCalendarSystem value) solar,
    required TResult Function(LunarCalendarSystem value) lunar,
  }) {
    return lunar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SolarCalendarSystem value)? solar,
    TResult? Function(LunarCalendarSystem value)? lunar,
  }) {
    return lunar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SolarCalendarSystem value)? solar,
    TResult Function(LunarCalendarSystem value)? lunar,
    required TResult orElse(),
  }) {
    if (lunar != null) {
      return lunar(this);
    }
    return orElse();
  }
}

abstract class LunarCalendarSystem extends CalendarSystem {
  const factory LunarCalendarSystem({final int defaultTimeZone}) =
      _$LunarCalendarSystemImpl;
  const LunarCalendarSystem._() : super._();

  @override
  int get defaultTimeZone;

  /// Create a copy of CalendarSystem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LunarCalendarSystemImplCopyWith<_$LunarCalendarSystemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
