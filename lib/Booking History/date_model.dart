class DateModel {
  DateTime dateTime;

  DateModel({required this.dateTime});

  Map<String, dynamic> toMap() {
    return {'dateTime': dateTime.microsecondsSinceEpoch};
  }

  factory DateModel.fromMap(Map<String, dynamic> map) {
    return DateModel(
        dateTime: DateTime.fromMicrosecondsSinceEpoch(map['dateTime']));
  }
}
