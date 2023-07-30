import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoom_clone/utils/logger.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore  = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  void addToMeetingHistory(String meetingName)async{
    try {
      await _firestore.collection("users").doc(_auth.currentUser!.uid).collection("meetings").add({
        "meetingName":meetingName,
        "createAt":DateTime.now()
      });
    } catch (e) {
      logger.e(e.toString());
    }
  } 
}