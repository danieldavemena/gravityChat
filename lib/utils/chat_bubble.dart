import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, required this.isUser, required this.user});

  final String message;
  final bool isUser;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Text(message, textAlign: isUser ? TextAlign.end : TextAlign.start,),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.53
                ),
                decoration: BoxDecoration(
                  boxShadow: List.filled(2, BoxShadow(color: const Color.fromARGB(46, 0, 0, 0), offset: Offset(0, 3), blurRadius: 4 )),
                  color: isUser ? Colors.green[200] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 5,),
              Text(user, style: TextStyle(fontSize: 10, color: Colors.grey[300]),),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ],
    );
  }
}