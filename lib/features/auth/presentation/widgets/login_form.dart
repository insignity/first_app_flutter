import 'package:auto_route/auto_route.dart';
import 'package:first_app_flutter/routing/app_router.dart';
import 'package:first_app_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/service_locator.dart';
import '../bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = sl<AuthBloc>();

    return BlocBuilder<AuthBloc, AuthState>(
      bloc: bloc..add(const AuthEvent.fetch()),
      builder: (context, state) {
        return state.when(
          loading: () {
            return const CircularProgressIndicator();
          },
          initial: () {
            return Text("initial state");
          },
          error: (message) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message),
                ElevatedButton(
                  onPressed: () => bloc.add(const AuthEvent.fetch()),
                  child: Text('Try again'),
                ),
              ],
            );
          },
          success: () {
            context.router.push(const HomeRoute());
            return const SizedBox.shrink();
          },
          loaded: (login, password) {
            return Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Login"),
                        WBox(
                          200,
                          child: TextField(
                            onChanged: (text) {
                              bloc.add(AuthEvent.onChangeLogin(text));
                            },
                          ),
                        ),
                      ],
                    ),
                    HBox(24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Password"),
                        WBox(200, child: TextField(
                          onChanged: (text) {
                            bloc.add(AuthEvent.onChangePassword(text));
                          },
                        )),
                      ],
                    ),
                    HBox(24),
                    ElevatedButton(
                      onPressed: login.isNotEmpty && password.isNotEmpty
                          ? () => bloc.add(const AuthEvent.login())
                          : null,
                      child: Text("Login"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
