import 'package:flutter/material.dart';
import 'package:flutterplayground/utils/user_page_nav.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Text("Title"),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: const Color.fromARGB(55, 0, 0, 0), offset: Offset(0, -5), blurRadius: 7)],
                  color: const Color.fromARGB(255, 241, 240, 240),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UserPageNav(onTap: () => Navigator.pushNamed(context, '/public'), icon: Icons.people,),
                        UserPageNav(onTap: () => {}, icon: Icons.person),
                        UserPageNav(onTap: () => {}, icon: Icons.settings)
                      ],
                    )
                  ],
                ),
              )
            )
          ],
        )
      ),
    );
  }
}