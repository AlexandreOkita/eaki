import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaki/models/dto/queue_number_dto.dart';
import 'package:eaki/models/queue_number.dart';
import 'package:eaki/repositories/firestore_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

final queueNumberRepository = Provider.autoDispose(
  (ref) => QueueNumberRepository(ref, ref.read(dbProvider)),
);

class QueueNumberRepository {
  final AutoDisposeProviderRef ref;
  final FirebaseFirestore db;

  QueueNumberRepository(this.ref, this.db);

  Future<QueueNumber?> getQueueNumberByToken(String token, VisitPurpose visitPurpose) async {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    final collection = FirestoreCollections.queueNumberCollection(db);
    final query = await collection
        .where("date", isGreaterThan: today)
//        .where("visit_purpose", isEqualTo: visitPurpose.name)
        .orderBy("date")
        .get();
    return query.docs
        .mapIndexed((index, e) => QueueNumber.fromMap(e.data() as Map<String, dynamic>, index + 1))
        .where((element) => element.token == token)
        .firstOrNull;
  }

  Future<QueueNumber> generateQueueNumber(QueueNumberDTO queueDTO, String token) async {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    final collection = FirestoreCollections.queueNumberCollection(db);
    final map = queueDTO.toMap();
    map["token"] = token;
    final response = await collection.add(map);

    final queueNumbersDocs = await collection.where("date", isGreaterThan: date).orderBy("date").get();

    final queueNumbersIdList = queueNumbersDocs.docs.map((doc) {
      return doc.id;
    });

    final number = queueNumbersIdList.toList().indexOf(response.id) + 1;

    return QueueNumber.fromDTO(queueDTO, number);
  }
}
