import 'package:eaki/models/dto/queue_number_dto.dart';

class QueueNumber {
  final String? hcNumber;
  final String? name;
  final int number;
  final DateTime date;
  final VisitPurpose visitPurpose;

  QueueNumber({
    this.hcNumber,
    this.name,
    required this.visitPurpose,
    required this.number,
    required this.date,
  });

  factory QueueNumber.fromDTO(QueueNumberDTO dto, int number) {
    return QueueNumber(
      visitPurpose: dto.visitPurpose,
      number: number,
      date: dto.date,
      hcNumber: dto.hcNumber,
      name: dto.name,
    );
  }
}

enum VisitPurpose {
  procedure,
  appointment,
}
