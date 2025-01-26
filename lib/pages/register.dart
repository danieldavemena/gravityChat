import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';
import 'package:flutterplayground/utils/input_widget.dart';
import 'package:flutterplayground/utils/authbutton.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final email = TextEditingController();
  final password = TextEditingController();

  void register() async{
    final auth = Auth();

    try {
      await auth.register(email.text, password.text);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 30.0),
                SizedBox(height: 20,),
                InputWidget(hintText: "Email", obscureText: false, controller: email),
                SizedBox(height: 10,),
                InputWidget(hintText: "Password", obscureText: true, controller: password),
                SizedBox(height: 20,),
                Authbutton(label: "Register", onTap: () => register())
              ],
            ),
          ),
        ),
      )
    );
  }
}