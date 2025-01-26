import 'package:flutter/material.dart';
import 'package:flutterplayground/services/firestore.dart';

class PublicChats extends StatefulWidget {
  const PublicChats({super.key});

  @override
  State<PublicChats> createState() => _PublicChatsState();
}

class _PublicChatsState extends State<PublicChats> {
  final firestore = Firestore();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: firestore.publicChat(), 
            builder: (context, snapshot) {
              return 
            }
          )
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                height: 57,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Icon(Icons.send, color: Colors.white,),
              )
            ],
          )
        )
      ],
    );
  }
}