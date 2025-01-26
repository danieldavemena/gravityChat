import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  final String title;

  const TitleBar({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: List.filled(2, BoxShadow(color: const Color.fromARGB(46, 0, 0, 0), offset: Offset(0, 3), blurRadius: 6 ))
              ),
            );
  }
}