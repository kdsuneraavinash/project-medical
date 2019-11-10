class Pharmacy {
  final String id;
  final String name;
  final String snippet;
  final String description;
  final double latitude;
  final double longitude;
  final String address;
  final String phoneNumber;
  final String imageUrl;
  final DateTime timestamp;

  Pharmacy(
      {this.id,
      this.name,
      this.snippet,
      this.description,
      this.latitude,
      this.longitude,
      this.address,
      this.phoneNumber,
      this.imageUrl,
      this.timestamp});

  factory Pharmacy.fromMap(Map<String, dynamic> map) {
    return Pharmacy(
      id: map["id"],
      name: map["name"],
      snippet: map["snippet"],
      description: map["description"],
      latitude: map["langitude"],
      longitude: map["longitude"],
      imageUrl: map["image_url"],
      address: map["address"],
      phoneNumber: map["phone_number"],
      timestamp: DateTime.parse(map["timestamp"]),
    );
  }
}
