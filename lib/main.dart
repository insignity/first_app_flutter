import 'package:first_app_client/first_app_client.dart';
import 'package:first_app_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:first_app_flutter/theming/theming.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';


import 'di/service_locator.dart';
import 'routing/app_router.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

final api = client.user;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () async {
              final response =
                  await api.create(User(name: "aero", image: "image.jpg"));
              print(response);
            },
            child: Text('create'),
          ),
          ElevatedButton(
            onPressed: () async {
              final response = await api.read(6);
              print(response);
            },
            child: Text('read'),
          ),
          ElevatedButton(
            onPressed: () async {
              final response = await api
                  .update(User(id: 0, name: "updated", image: "images.jpg"));
              print(response);
            },
            child: Text('update'),
          ),
          ElevatedButton(
            onPressed: () async {
              await client.user.delete(6);
              print('end');
            },
            child: Text('delete'),
          ),
          ElevatedButton(
            onPressed: () async {
              final response = await client.user.readAll();
              print(response);
            },
            child: Text('readall'),
          ),
        ],
      ),
    );
  }
}
