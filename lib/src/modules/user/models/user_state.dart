import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:religion_calendar_app/src/modules/user/models/models.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isLoading,
    User? user,
    String? error,
  }) = _UserState;

  const UserState._();

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);

  factory UserState.unknow() => const UserState(
        user: null,
        isLoading: false,
        error: null,
      );

  UserState copyWithIsLoading(bool isLoading) {
    return UserState(
      user: user,
      isLoading: isLoading,
      error: null,
    );
  }
}
