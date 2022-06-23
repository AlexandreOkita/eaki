import 'package:eaki/models/dto/queue_number_dto.dart';
import 'package:eaki/models/queue_number.dart';
import 'package:eaki/repositories/queue_number_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final queueNumberGeneratorProvider = FutureProvider<QueueNumber>((ref) {
  final dto = ref.watch(queueNumberDTOProvider);
  return ref.read(queueNumberRepository).generateQueueNumber(dto);
});

final queueNumberDTOProvider = StateProvider<QueueNumberDTO>((ref) {
  return QueueNumberDTO(
    visitPurpose: VisitPurpose.appointment,
    date: DateTime.now(),
  );
});
