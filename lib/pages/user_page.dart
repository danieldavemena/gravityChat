import 'package:flutter/material.dart';
import 'package:flutterplayground/utils/id_box.dart';
import 'package:flutterplayground/utils/user_page_nav.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  BoxShadow shadowTop = shadows![0];
  Color bgColors = const Color.fromARGB(255, 229, 229, 229);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Expanded(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: bgColors,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                  boxShadow: [BoxShadow(color: const Color.fromARGB(80, 0, 0, 0), offset: Offset(0, -3),blurRadius: 5)]
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    IdBox(),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        UserPageNav(onTap: () => Navigator.pushNamed(context, '/public'), icon: Icons.people,),
                        UserPageNav(onTap: () => {}, icon: Icons.person),
                        UserPageNav(onTap: () => {auth.signOut()}, icon: Icons.settings)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}