
import 'package:flutter/material.dart';
import 'package:flutterplayground/services/auth.dart';
import 'package:flutterplayground/services/firestore.dart';
import 'package:flutterplayground/utils/chat_bubble.dart';

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
      backgroundColor: Colors.green[300],
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 30,),
          Container(
            height: 80,
            child: Text("PUBLIC CHATROOM", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 33), textAlign: TextAlign.center,),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: const Color.fromARGB(55, 0, 0, 0), offset: Offset(0, -5), blurRadius: 7)],
                color: const Color.fromARGB(255, 241, 240, 240),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: Column(
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
            ),
          ),
        ],
      ),
    );
  }
}