import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream <QuerySnapshot> publicChat() {
    return firestore.collection("publicChat").orderBy("timestamp", descending: false).snapshots();
  }

  void sendMessage(String message, userID) {
      Map <String, dynamic> data = {
        "message" : message,
        "userID" : userID,
        "timestamp": Timestamp.now()
      };

    firestore.collection("publicChat").add(data);
  }

}