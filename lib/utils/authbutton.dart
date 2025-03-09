import 'package:flutter/material.dart';

class Authbutton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const Authbutton({required this.label, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Text(label, textAlign: TextAlign.center, style: TextStyle()),
      ),
    );
  }
}
