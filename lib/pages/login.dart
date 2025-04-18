import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';
import 'package:flutterplayground/utils/authbutton.dart';
import 'package:flutterplayground/utils/input_widget.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void login(BuildContext context) async {
    final auth = Auth();

    try {
      await auth.login(email.text, password.text);
    } catch (ex) {
      return showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Text(ex.toString()),
            );
          });
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
                  hintText: "Email", obscureText: false, controller: email),
              const SizedBox(
                height: 10,
              ),
              InputWidget(
                  hintText: "Password",
                  obscureText: true,
                  controller: password),
              const SizedBox(
                height: 20,
              ),
              Authbutton(label: "Login", onTap: () => login(context)),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/register'),
                child: const Text("Register now"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
