// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_form_setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FeedbackFormSetting _$FeedbackFormSettingFromJson(Map<String, dynamic> json) {
  return _FeedbackFormSetting.fromJson(json);
}

/// @nodoc
mixin _$FeedbackFormSetting {
  bool get isExpanded => throw _privateConstructorUsedError;
  FeedbackForm get feedbackForm => throw _privateConstructorUsedError;

  /// Serializes this FeedbackFormSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackFormSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackFormSettingCopyWith<FeedbackFormSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackFormSettingCopyWith<$Res> {
  factory $FeedbackFormSettingCopyWith(
          FeedbackFormSetting value, $Res Function(FeedbackFormSetting) then) =
      _$FeedbackFormSettingCopyWithImpl<$Res, FeedbackFormSetting>;
  @useResult
  $Res call({bool isExpanded, FeedbackForm feedbackForm});

  $FeedbackFormCopyWith<$Res> get feedbackForm;
}

/// @nodoc
class _$FeedbackFormSettingCopyWithImpl<$Res, $Val extends FeedbackFormSetting>
    implements $FeedbackFormSettingCopyWith<$Res> {
  _$FeedbackFormSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackFormSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? feedbackForm = null,
  }) {
    return _then(_value.copyWith(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      feedbackForm: null == feedbackForm
          ? _value.feedbackForm
          : feedbackForm // ignore: cast_nullable_to_non_nullable
              as FeedbackForm,
    ) as $Val);
  }

  /// Create a copy of FeedbackFormSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FeedbackFormCopyWith<$Res> get feedbackForm {
    return $FeedbackFormCopyWith<$Res>(_value.feedbackForm, (value) {
      return _then(_value.copyWith(feedbackForm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeedbackFormSettingImplCopyWith<$Res>
    implements $FeedbackFormSettingCopyWith<$Res> {
  factory _$$FeedbackFormSettingImplCopyWith(_$FeedbackFormSettingImpl value,
          $Res Function(_$FeedbackFormSettingImpl) then) =
      __$$FeedbackFormSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isExpanded, FeedbackForm feedbackForm});

  @override
  $FeedbackFormCopyWith<$Res> get feedbackForm;
}

/// @nodoc
class __$$FeedbackFormSettingImplCopyWithImpl<$Res>
    extends _$FeedbackFormSettingCopyWithImpl<$Res, _$FeedbackFormSettingImpl>
    implements _$$FeedbackFormSettingImplCopyWith<$Res> {
  __$$FeedbackFormSettingImplCopyWithImpl(_$FeedbackFormSettingImpl _value,
      $Res Function(_$FeedbackFormSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FeedbackFormSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
    Object? feedbackForm = null,
  }) {
    return _then(_$FeedbackFormSettingImpl(
      isExpanded: null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      feedbackForm: null == feedbackForm
          ? _value.feedbackForm
          : feedbackForm // ignore: cast_nullable_to_non_nullable
              as FeedbackForm,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackFormSettingImpl extends _FeedbackFormSetting {
  const _$FeedbackFormSettingImpl(
      {this.isExpanded = false, required this.feedbackForm})
      : super._();

  factory _$FeedbackFormSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackFormSettingImplFromJson(json);

  @override
  @JsonKey()
  final bool isExpanded;
  @override
  final FeedbackForm feedbackForm;

  @override
  String toString() {
    return 'FeedbackFormSetting(isExpanded: $isExpanded, feedbackForm: $feedbackForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackFormSettingImpl &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded) &&
            (identical(other.feedbackForm, feedbackForm) ||
                other.feedbackForm == feedbackForm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isExpanded, feedbackForm);

  /// Create a copy of FeedbackFormSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackFormSettingImplCopyWith<_$FeedbackFormSettingImpl> get copyWith =>
      __$$FeedbackFormSettingImplCopyWithImpl<_$FeedbackFormSettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackFormSettingImplToJson(
      this,
    );
  }
}

abstract class _FeedbackFormSetting extends FeedbackFormSetting {
  const factory _FeedbackFormSetting(
      {final bool isExpanded,
      required final FeedbackForm feedbackForm}) = _$FeedbackFormSettingImpl;
  const _FeedbackFormSetting._() : super._();

  factory _FeedbackFormSetting.fromJson(Map<String, dynamic> json) =
      _$FeedbackFormSettingImpl.fromJson;

  @override
  bool get isExpanded;
  @override
  FeedbackForm get feedbackForm;

  /// Create a copy of FeedbackFormSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackFormSettingImplCopyWith<_$FeedbackFormSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
