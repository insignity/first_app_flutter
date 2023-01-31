part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.fetch() = _Fetch;

  const factory AuthEvent.onChangeLogin(String text) = _OnChangeLogin;

  const factory AuthEvent.onChangePassword(String text) = _OnChangePassword;

  const factory AuthEvent.login() = _Login;
}
