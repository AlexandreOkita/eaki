import 'package:eaki/models/specialty.dart';
import 'package:eaki/repositories/specialty_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCurrentSpecialtiesProvider = FutureProvider.autoDispose<List<Specialty>>((ref) {
  return ref.watch(specialtyRepository).getCurrentSpecialties();
});
