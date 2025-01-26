import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  
  const InputWidget({
    required this.hintText,
    required this.obscureText,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      ),
      obscureText: obscureText,
      controller: controller,
    );
  }
}