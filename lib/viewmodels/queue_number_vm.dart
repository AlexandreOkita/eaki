import 'package:eaki/models/queue_number.dart';
import 'package:eaki/providers/queue_number_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final queueNumberVM = Provider.autoDispose(
  (ref) => QueueNumberVM(ref),
);

class QueueNumberVM {
  final AutoDisposeProviderRef ref;

  QueueNumberVM(this.ref);

  updateVisitPurpose(VisitPurpose visitPurpose) {
    final currentQueueNumber = ref.read(queueNumberDTOProvider);
    ref.read(queueNumberDTOProvider.notifier).state =
        currentQueueNumber.copy(visitPurpose: visitPurpose);
  }

  updateName(String name) {
    final currentQueueNumber = ref.read(queueNumberDTOProvider);
    ref.read(queueNumberDTOProvider.notifier).state =
        currentQueueNumber.copy(name: name);
  }

  updateHCNumber(String hcNumber) {
    final currentQueueNumber = ref.read(queueNumberDTOProvider);
    ref.read(queueNumberDTOProvider.notifier).state =
        currentQueueNumber.copy(hcNumber: hcNumber);
  }
}
