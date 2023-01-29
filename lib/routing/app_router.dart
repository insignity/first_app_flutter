import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:first_app_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../features/auth/presentation/pages/register_page.dart';
import 'guards/auth_guard.dart';

part 'app_router.gr.dart';

@singleton
@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: RegisterPage, path: '/register', initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
