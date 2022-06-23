import 'package:eaki/models/queue_number.dart';

class QueueNumberDTO {
  final String? hcNumber;
  final String? name;
  final DateTime date;
  final VisitPurpose visitPurpose;

  QueueNumberDTO({
    this.hcNumber,
    this.name,
    required this.visitPurpose,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      "hc_number": hcNumber ?? "",
      "name": name ?? "",
      "visit_purpose": visitPurpose.name,
      "date": date
    };
  }

  copy({String? hcNumber, String? name, VisitPurpose? visitPurpose, DateTime? date}) {
    return QueueNumberDTO(
        visitPurpose: visitPurpose ?? this.visitPurpose,
        date: date ?? this.date,
        name: name ?? this.name,
        hcNumber: hcNumber ?? this.hcNumber);
  }
}
