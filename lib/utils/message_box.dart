import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';
import 'package:flutterplayground/services/firestore.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({super.key});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {

  final _firestore = Firestore();
  final _auth = Auth();
  final _userMessage = TextEditingController();


  tangina() {
    if (_userMessage.text.isNotEmpty) {
      _firestore.sendMessage(_userMessage.text, _auth.getUser()!.email);
    } 

    _userMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _userMessage,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: tangina,
            child: Container(
              height: 57,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(15)),
              child: Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}