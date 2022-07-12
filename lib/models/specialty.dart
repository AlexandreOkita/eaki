class Specialty {
  final String name;
  final int weekday;
  final DayTurn turn;

  Specialty({required this.name, required this.weekday, required this.turn});
}

enum DayTurn {
  morning,
  afternoon;

  factory DayTurn.current() {
    if (DateTime.now().hour > 12) {
      return DayTurn.afternoon;
    }
    return DayTurn.morning;
  }

  factory DayTurn.fromString(String s) {
    switch (s) {
      case "morning":
        return DayTurn.morning;
      case "afternoon":
        return DayTurn.afternoon;
      default:
        return DayTurn.morning;
    }
  }
}
