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
      _firestore.sendMessage(_userMessage.text, _auth.getUser()!.displayName);
    } 

    _userMessage.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[300],
        boxShadow: [BoxShadow(color: const Color.fromARGB(29, 0, 0, 0), offset: Offset(0, -3), blurRadius: 5)],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.all(14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _userMessage,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none, width: 0),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)))
                )
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
              child: Icon(
                Icons.send,
                color: Colors.green[300],
              ),
            ),
          )
        ],
      ),
    );
  }
}