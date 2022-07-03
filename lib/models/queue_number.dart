import 'package:eaki/models/dto/queue_number_dto.dart';

class QueueNumber {
  final String? hcNumber;
  final String? name;
  final String token;
  final int number;
  final DateTime date;
  final VisitPurpose visitPurpose;

  QueueNumber({
    this.hcNumber,
    this.name,
    required this.token,
    required this.visitPurpose,
    required this.number,
    required this.date,
  });

  factory QueueNumber.fromDTO(QueueNumberDTO dto, int number) {
    return QueueNumber(
      token: dto.token,
      visitPurpose: dto.visitPurpose,
      number: number,
      date: dto.date,
      hcNumber: dto.hcNumber,
      name: dto.name,
    );
  }

  factory QueueNumber.fromMap(Map<String, dynamic> map, int number) {
    return QueueNumber(
      token: map["token"],
      visitPurpose: map["visit_purpose"],
      number: number,
      date: map["date"].toDate(),
      hcNumber: map["hc_number"],
      name: map["name"],
    );
  }
}

enum VisitPurpose {
  procedure,
  appointment,
}
