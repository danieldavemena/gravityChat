import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';
import 'package:flutterplayground/services/firestore.dart';
import 'package:flutterplayground/utils/chat_bubble.dart';
import 'package:flutterplayground/utils/global_drawer.dart';
import 'package:flutterplayground/utils/message_box.dart';

class PublicChats extends StatefulWidget {
  const PublicChats({super.key});

  @override
  State<PublicChats> createState() => _PublicChatsState();
}

class _PublicChatsState extends State<PublicChats> {

  final _firestore = Firestore();
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: GlobalDrawer(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore.publicChat(), 
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                 return Container();
                } else if (snapshot.hasData) {
                  var data = snapshot.data!.docs;

                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var doc = data[index];
                      bool isUser = false;

                      if (doc["userID"] == _auth.getUser()!.email) {
                        isUser = true;
                      }

                      return ChatBubble(message: doc['message'], isUser: isUser, user: doc['userID']);

                              
                    }
                  );
                } else {
                  return Center(
                    child: Text("Loading..."),
                );
                }
                
              }
            )
          ),
          MessageBox()
        ],
      ),
    );
  }
}