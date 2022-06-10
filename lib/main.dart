import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:temp/login.dart';
import 'splash.dart';
import 'package:get/get.dart';
import 'home.dart';
import 'newchat.dart';
import 'chat/chat.dart';
import 'explore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TogetherCar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home' : (context) => const MainScreen(title: ''),
        '/chat' : (context) => const ChatScreen(title: ''),
        '/chating' : (context) => ChatPage(),
        'explore' : (context) => const ExploreScreen(title: ''),
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
