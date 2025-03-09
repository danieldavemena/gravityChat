import 'package:flutter/material.dart';
import 'package:flutterplayground/utils/auth_gate.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return const AuthGate();
  }
}
