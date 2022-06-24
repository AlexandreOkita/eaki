import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaki/models/dto/queue_number_dto.dart';
import 'package:eaki/models/queue_number.dart';
import 'package:eaki/repositories/firestore_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final queueNumberRepository = Provider.autoDispose(
  (ref) => QueueNumberRepository(ref, FirebaseFirestore.instance),
);

class QueueNumberRepository {
  final AutoDisposeProviderRef ref;
  final FirebaseFirestore db;

  QueueNumberRepository(this.ref, this.db);

  Future<QueueNumber> generateQueueNumber(QueueNumberDTO queueDTO) async {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    final collection = FirestoreCollections.queueNumberCollection(db);

    final response = await collection.add(queueDTO.toMap());

    final queueNumbersDocs = await collection
        .where("date", isGreaterThan: date)
        .orderBy("date")
        .get();

    final queueNumbersIdList = queueNumbersDocs.docs.map((doc) {
      return doc.id;
    });

    final number = queueNumbersIdList.toList().indexOf(response.id) + 1;

    return QueueNumber.fromDTO(queueDTO, number);
  }
}
