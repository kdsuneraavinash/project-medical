class Symptom {
  final String id;
  final String name;
  final DateTime timestamp;

  Symptom({this.id, this.name, this.timestamp});

  factory Symptom.fromMap(Map<String, dynamic> map) {
    return Symptom(
      id: map["id"],
      name: map["name"],
      timestamp:
          map["timestamp"] != null ? DateTime.tryParse(map["timestamp"]) : null,
    );
  }
}
