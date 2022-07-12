import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eaki/models/specialty.dart';
import 'package:eaki/repositories/firestore_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final specialtyRepository = Provider.autoDispose(
  (ref) => SpecialtyRepository(ref, ref.read(dbProvider)),
);

class SpecialtyRepository {
  final AutoDisposeProviderRef ref;
  final FirebaseFirestore db;

  SpecialtyRepository(this.ref, this.db);

  Future<List<Specialty>> getCurrentSpecialties() {
    final weekDay = DateTime.now().weekday;
    final currentTurn = DayTurn.current();

    return db
        .collection("specialties")
        .where("weekday", isEqualTo: weekDay)
        .where("turn", isEqualTo: currentTurn.name)
        .get()
        .then((value) => value.docs
            .map((e) => Specialty(
                name: e["name"], weekday: e["weekday"], turn: DayTurn.fromString(e["turn"])))
            .toList());
  }
}
