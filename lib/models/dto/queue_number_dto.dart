import 'package:eaki/models/queue_number.dart';

class QueueNumberDTO {
  final String token;
  final String? hcNumber;
  final String? name;
  final DateTime date;
  final VisitPurpose visitPurpose;

  QueueNumberDTO({
    required this.token,
    this.hcNumber,
    this.name,
    required this.visitPurpose,
    required this.date,
  });

  factory QueueNumberDTO.fromMap(Map<String, dynamic> map) {
    return QueueNumberDTO(
      token: map['token'],
      visitPurpose: map["visit_purpose"],
      date: map["date"].toDate(),
      hcNumber: map["hc_number"],
      name: map["name"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "hc_number": hcNumber ?? "",
      "name": name ?? "",
      "visit_purpose": visitPurpose.name,
      "date": date
    };
  }

  copy({String? hcNumber, String? name, VisitPurpose? visitPurpose, DateTime? date, String? token}) {
    return QueueNumberDTO(
        token: token ?? this.token,
        visitPurpose: visitPurpose ?? this.visitPurpose,
        date: date ?? this.date,
        name: name ?? this.name,
        hcNumber: hcNumber ?? this.hcNumber);
  }
}
