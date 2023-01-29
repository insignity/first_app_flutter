import 'package:auto_route/auto_route.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  // String? get token => Hive.box('token').get('token');

  AuthGuard();

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    // if (token != null) {
    //   resolver.next();
    // } else {
    //   await router.push(const IntroRoute());
    //   resolver.next(false);
    // }
  }
}
