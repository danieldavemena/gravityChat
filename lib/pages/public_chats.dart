
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';
import 'package:flutterplayground/services/firestore.dart';
import 'package:flutterplayground/utils/chat_bubble.dart';

class PublicChats extends StatefulWidget {
  const PublicChats({super.key});

  @override
  State<PublicChats> createState() => _PublicChatsState();
}

class _PublicChatsState extends State<PublicChats> {
  final Firestore _firestore = Firestore();
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: StreamBuilder(
                  stream: _firestore.publicChat(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Error");
                    }
              
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading...");
                    }
              
                    return ListView(
                      children: snapshot.data!.docs.map((doc) => _messageBuilder(doc)).toList()
                    );
                  }),
            )),
        Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 57,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )
              ],
            ))
      ],
    );
  }

  Widget _messageBuilder(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isUser = false;

    if (_auth.getUser()!.email == data["userID"]) {
      isUser = true;
    }

    return ChatBubble(message: data["message"], isUser: isUser, user: data["userID"],);
  }
}
