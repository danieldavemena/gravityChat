import 'package:flutter/material.dart';
import 'package:flutterplayground/pages/public_chats.dart';
import 'package:flutterplayground/services/auth.dart';
import 'package:flutterplayground/utils/navigation_item.dart';
import 'package:flutterplayground/utils/title_bar.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  
  final Auth _auth = Auth();

  double titleSize = 150;
  Widget topWidget = TitleBar(title: "GRAVITY",);
  Widget page = Container();

  void private(){
    setState(() {
      titleSize = 30;
      topWidget = Container();
      page = Container();
    });
  }

  void public(){
    setState(() {
      titleSize = 30;
      topWidget = Container();
      page = PublicChats();
    });
  }

  void home(){
    setState(() {
      titleSize = 150;
      topWidget = TitleBar(title: "GRAVITY",);
      page = Container();
    });
  }

  void settings() {
    setState(() {
      page = Container();
      topWidget = Container();
      titleSize = MediaQuery.of(context).size.height * 0.80;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOut,
            height: titleSize,
            padding: EdgeInsets.all(35),
            child: topWidget
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: List.filled(2, BoxShadow(color: const Color.fromARGB(46, 0, 0, 0), offset: Offset(0, -2), blurRadius: 6 )),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    height: 10,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(80)
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: page
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationItem(icon: Icons.home_outlined, label: "Home", onTap: () => home(),),
                NavigationItem(icon: Icons.people_outline, label: "Public", onTap: () => public(),),
                NavigationItem(icon: Icons.person_outline, label: "Private", onTap: () => private()),
                NavigationItem(icon: Icons.settings_outlined, label: "Settings", onTap: () => settings()),
              ],
            ),
          )
        ],
      ),
    );
  }
}