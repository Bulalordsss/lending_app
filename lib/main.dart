import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lending_application/screens/home.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/mainpage.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WelcomeScreen(), // Start with WelcomeScreen
      routes: {
        '/login': (context) => const Login(),  // Navigate to Login
        '/signup': (context) => const Signup(),  // Navigate to Signup
        '/mainpage': (context) => const Navigate(),
      },
    );
  }
}
