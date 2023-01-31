part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;

  const factory AuthState.initial() = _Initial;

  const factory AuthState.error({required String message}) = _Error;

  const factory AuthState.loaded({
    required String login,
    required String password,
  }) = _Loaded;

  const factory AuthState.success() = _Success;
}
