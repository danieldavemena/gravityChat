import 'package:flutter/material.dart';
import 'package:flutterplayground/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterplayground/pages/login.dart';
import 'package:flutterplayground/pages/public_chats.dart';
import 'package:flutterplayground/pages/register.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  return (runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      theme: ThemeData(primarySwatch: Colors.amber),
      routes: {
        '/home': (context) => const Homepage(),
        '/public': (context) => const PublicChats(),
        '/register': (context) => const Register(),
        '/login': (context) => Login()
      },
    );
  }
}
