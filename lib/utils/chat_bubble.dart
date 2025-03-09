import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isUser,
      required this.user});

  final String message;
  final bool isUser;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment:
                isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.53),
                decoration: BoxDecoration(
                  boxShadow: List.filled(
                      2,
                      const BoxShadow(
                          color: Color.fromARGB(46, 0, 0, 0),
                          offset: Offset(0, 3),
                          blurRadius: 4)),
                  color: isUser ? Colors.green[200] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  message,
                  textAlign: isUser ? TextAlign.end : TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                user,
                style: const TextStyle(
                    fontSize: 10, color: Color.fromARGB(255, 134, 134, 134)),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
