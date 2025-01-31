import 'package:flutter/material.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("fbakfbkjh")),
            ListTile(
              title: Text("Home"),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            ListTile(
              title: Text("Public Chat"),
              onTap: () => Navigator.pushNamed(context, '/public'),
            )
          ],
        ),
      );
  }
}