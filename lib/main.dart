import 'package:first_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:first_app_flutter/theming/theming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/service_locator.dart';
import 'routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => sl<AuthBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Serverpod Demo',
        theme: Theming.themeData,
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // theme: Theming.mobile,
        routerDelegate: sl<AppRouter>().delegate(),
        routeInformationParser: sl<AppRouter>().defaultRouteParser(),
      ),
    );
  }
}
