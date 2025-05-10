import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/authentication/models/auth_results.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';
import 'package:flutter/foundation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthResults? result,
    required bool isLoading,
    required User? user,
  }) = _AuthState;

  const AuthState._();

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  factory AuthState.unknown() => const AuthState(
        result: null,
        isLoading: false,
        user: null,
      );

  AuthState copyWithIsLoading(bool isLoading) {
    return AuthState(
      result: result,
      isLoading: isLoading,
      user: user,
    );
  }

  UserId? get userId => user?.userId;
  bool get isLoggedIn => user != null;
  bool? get hasCompleteOnboarding => user?.hasCompleteOnboarding;
  String? get profileImageUrl => user?.profileImageUrl;
  ReligionPreference? get religionPreference => user?.religionPreference;
  String? get userName => user?.displayName;
  String? get userEmail => user?.email;
  bool get isAuthenticated => user != null;
  bool get isNotAuthenticated => user == null;
  bool get isOnboardingComplete => user?.hasCompleteOnboarding == true;
  bool get isVerified => user?.isVerified == true;
}
