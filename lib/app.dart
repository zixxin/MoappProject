import 'package:flutter/material.dart';
import 'login.dart';
import 'chat.dart';
import 'colors.dart';

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '가치모여',
      home: const LoginPage(),
      theme: ThemeData(
          primaryColor: Primary,
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage (),
        '/chat' : (context) => ChatPage (),
      },
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}