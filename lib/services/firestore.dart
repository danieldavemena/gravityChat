import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream <List<Map<String,dynamic>>> publicChat() {
    return firestore.collection("publicChat").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final chats = doc.data();

        return chats;

      }).toList();
    });
  }

}