import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';
import 'user_page_nav.dart';

final auth = Auth();

class IdBox extends StatelessWidget {
  const IdBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(12),
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green[300],
          boxShadow: shadows),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            auth.getUser()!.displayName.toString(),
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            auth.getUser()!.email.toString(),
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
