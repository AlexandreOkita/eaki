import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollections {
  static CollectionReference queueNumberCollection(FirebaseFirestore db) {
    return db.collection("queue_numbers");
  }
}
