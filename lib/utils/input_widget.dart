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
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
                  borderRadius: BorderRadius.circular(30)
                )
      ),
      obscureText: obscureText,
      controller: controller,
    );
  }
}