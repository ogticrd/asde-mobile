class Ruta {
  final int id;
  final int circumscription;
  final String sector;
  String? subSector;
  final bool isAvailableMonday;
  final bool isAvailableTuesday;
  final bool isAvailableWednesday;
  final bool isAvailableThursday;
  final bool isAvailableFriday;
  final bool isAvailableSaturday;
  final bool isAvailableSunday;
  final String startTime;
  final String endTime;

  Ruta(
      {required this.id,
      required this.circumscription,
      required this.sector,
      required this.subSector,
      required this.isAvailableMonday,
      required this.isAvailableTuesday,
      required this.isAvailableWednesday,
      required this.isAvailableThursday,
      required this.isAvailableFriday,
      required this.isAvailableSaturday,
      required this.isAvailableSunday,
      required this.startTime,
      required this.endTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'circumscription': circumscription,
      'sector': sector,
      'isAvailableMonday': isAvailableMonday,
      'isAvailableTuesday': isAvailableTuesday,
      'isAvailableWednesday': isAvailableWednesday,
      'isAvailableThursday': isAvailableThursday,
      'isAvailableFriday': isAvailableFriday,
      'isAvailableSaturday': isAvailableSaturday,
      'isAvailableSunday': isAvailableSunday,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory Ruta.fromMap(Map<String, dynamic> map) {
    return new Ruta(
        id: map['id'],
        circumscription: map['circumscription'],
        sector: map['sector'],
        subSector: map['subSector'],
        isAvailableMonday: map['isAvailableMonday'] == 0 ? false : true,
        isAvailableTuesday: map['isAvailableTuesday'] == 0 ? false : true,
        isAvailableWednesday: map['isAvailableWednesday'] == 0 ? false : true,
        isAvailableThursday: map['isAvailableThursday'] == 0 ? false : true,
        isAvailableFriday: map['isAvailableFriday'] == 0 ? false : true,
        isAvailableSaturday: map['isAvailableSaturday'] == 0 ? false : true,
        isAvailableSunday: map['isAvailableSunday'] == 0 ? false : true,
        startTime: map['startTime'],
        endTime: map['endTime']);
  }

  @override
  String toString() {
    return "Route{'id': $id, 'circumscription': $circumscription, 'sector': $sector, 'isAvailableMonday': $isAvailableMonday, 'isAvailableTuesday': $isAvailableTuesday, 'isAvailableWednesday': $isAvailableWednesday, 'isAvailableThursday': $isAvailableThursday, 'isAvailableFriday': $isAvailableFriday, 'isAvailableSaturday': $isAvailableSaturday, 'isAvailableSunday': $isAvailableSunday, 'startTime': $startTime, 'endTime': $endTime,}";
  }
}
