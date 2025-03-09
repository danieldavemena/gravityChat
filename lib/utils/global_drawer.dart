import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';

class GlobalDrawer extends StatefulWidget {
  const GlobalDrawer({super.key});

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text("fbakfbkjh")),
          ListTile(
            title: const Text("Home"),
            onTap: () => Navigator.pushNamed(context, '/home'),
          ),
          ListTile(
            title: const Text("Public Chat"),
            onTap: () => Navigator.pushNamed(context, '/public'),
          ),
          ListTile(
            title: const Text("Log Out"),
            onTap: () {
              _auth.signOut();
              Navigator.pushNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }
}
