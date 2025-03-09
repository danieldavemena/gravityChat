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
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: bgColors,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(80, 0, 0, 0),
                        offset: Offset(0, -3),
                        blurRadius: 5)
                  ]),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const IdBox(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      UserPageNav(
                        onTap: () => Navigator.pushNamed(context, '/public'),
                        icon: Icons.people,
                      ),
                      UserPageNav(onTap: () => {}, icon: Icons.person),
                      UserPageNav(
                          onTap: () => {auth.signOut()}, icon: Icons.settings)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
