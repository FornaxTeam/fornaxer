import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'code/page.dart';
import 'settings/appearance.dart';
import 'settings/general.dart';

void main() {
  runApp(FornaxerApp());
}

class FornaxerApp extends StatelessWidget {
  FornaxerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fornaxer',
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true),
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.blue,
          useMaterial3: true),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (_, __) => const CodePage(), routes: [
        GoRoute(
            builder: (_, __) => const GeneralSettingsPage(),
            path: 'settings',
            routes: [
              GoRoute(
                path: 'appearance',
                builder: (_, __) => const AppearanceSettingsPage(),
              ),
            ]),
      ]),
    ],
  );
}
