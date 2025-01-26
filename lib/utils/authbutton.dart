import 'package:flutter/material.dart';

class Authbutton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  
  const Authbutton({
    required this.label,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}