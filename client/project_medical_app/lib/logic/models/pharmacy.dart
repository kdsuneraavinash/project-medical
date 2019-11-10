class Pharmacy {
  final String id;
  final String name;
  final String snippet;
  final String description;
  final double lagitude;
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
      this.lagitude,
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
      lagitude: map["description"],
      longitude: map["description"],
      imageUrl: map["image_url"],
      address: map["address"],
      phoneNumber: map["phone_number"],
      timestamp: DateTime.parse(map["timestamp"]),
    );
  }
}
