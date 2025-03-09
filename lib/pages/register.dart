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
  final username = TextEditingController();
  final confirm = TextEditingController();

  void register() async {
    final auth = Auth();

    try {
      await auth.register(username.text, email.text, password.text);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          color: Colors.green[300],
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 30.0),
              const SizedBox(
                height: 20,
              ),
              InputWidget(
                  hintText: "Username",
                  obscureText: false,
                  controller: username),
              const SizedBox(
                height: 10,
              ),
              InputWidget(
                  hintText: "Email", obscureText: false, controller: email),
              const SizedBox(
                height: 10,
              ),
              InputWidget(
                  hintText: "Password",
                  obscureText: true,
                  controller: password),
              const SizedBox(
                height: 10,
              ),
              InputWidget(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirm),
              const SizedBox(
                height: 20,
              ),
              Authbutton(label: "Register", onTap: () => register()),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/login'),
                child: const Text("Go to Login"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
