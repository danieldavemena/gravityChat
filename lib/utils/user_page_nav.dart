import 'package:flutter/material.dart';

  List <BoxShadow>? shadows = [
    BoxShadow(color: Colors.grey, offset: Offset(3, 3),blurRadius: 5),
    BoxShadow(color: const Color.fromARGB(255, 255, 255, 255), offset: Offset(-3, -3), blurRadius: 5),
  ];

class UserPageNav extends StatelessWidget {
  const UserPageNav({super.key, required this.onTap, required this.icon});

  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                           
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green[200],
                              boxShadow: shadows 
                            ),
                            child: Icon(icon, color: Colors.white, size: 40,),
                          ),
    );
  }
}