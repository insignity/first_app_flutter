import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:first_app_client/first_app_client.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../services/api/api.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        fetch: () {
          emit(const _Loading());
          emit(const _Loaded(login: '', password: ''));
        },
        onChangeLogin: (text) {
          if (state is _Loaded) {
            final s = state as _Loaded;
            emit(s.copyWith(login: text, password: s.password));
          }
        },
        onChangePassword: (text) {
          if (state is _Loaded) {
            final s = state as _Loaded;
            emit(s.copyWith(login: s.login, password: text));
          }
        },
        login: () async {
          if (state is _Loaded) {
            final _Loaded old = state as _Loaded;
            emit(const AuthState.loading());
            try {
              await Future.delayed(const Duration(seconds: 1)); //TODO: REMOVE
              final response = await api.login(User(
                login: old.login,
                password: old.password,
              ));
              if (response is User) {
                emit(const _Success());
              } else {
                emit(_Error(message: "Login or password is incorrect"));
              }
            } catch (e) {
              emit(_Error(message: e.toString()));
            }
          }
        },
      );
    });
  }
}
