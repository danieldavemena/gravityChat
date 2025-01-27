import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream <QuerySnapshot> publicChat() {
    return firestore.collection("publicChat").orderBy("timestamp", descending: false).snapshots();
  }

}