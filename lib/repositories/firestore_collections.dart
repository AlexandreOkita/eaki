import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbProvider = Provider((ref) => FirebaseFirestore.instance);

class FirestoreCollections {
  static CollectionReference queueNumberCollection(FirebaseFirestore db) {
    return db.collection("queue_numbers");
  }
}
