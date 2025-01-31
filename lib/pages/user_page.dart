import 'package:flutter/material.dart';
import 'package:flutterplayground/utils/global_drawer.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: GlobalDrawer(),
      body: Container(
        child: Text("user page"),
      ),
    );
  }
}