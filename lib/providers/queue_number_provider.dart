import 'package:eaki/models/dto/queue_number_dto.dart';
import 'package:eaki/models/queue_number.dart';
import 'package:eaki/providers/auth_provider.dart';
import 'package:eaki/repositories/queue_number_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentQueueNumber = FutureProvider.autoDispose<QueueNumber?>((ref) {
  final user = ref.watch(loggedUser);
  return user == null
      ? null
      : ref.watch(queueNumberRepository).getQueueNumberByToken(user.uid, VisitPurpose.procedure);
});

final queueNumberGeneratorProvider = FutureProvider<QueueNumber>((ref) {
  final dto = ref.watch(queueNumberDTOProvider);
  final user = ref.watch(loggedUser);

  return ref.read(queueNumberRepository).generateQueueNumber(dto, user!.uid);
});

final queueNumberDTOProvider = StateProvider<QueueNumberDTO>((ref) {
  final user = ref.watch(loggedUser);
  return QueueNumberDTO(
    token: user?.uid ?? "",
    visitPurpose: VisitPurpose.appointment,
    date: DateTime.now(),
  );
});
