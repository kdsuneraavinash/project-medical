class Disease {
  final String id;
  final String name;
  final String snippet;
  final String description;
  final String imageUrl;
  final DateTime timestamp;

  Disease(
      {this.id,
      this.name,
      this.snippet,
      this.description,
      this.imageUrl,
      this.timestamp});

  factory Disease.fromMap(Map<String, dynamic> map) {
    return Disease(
      id: map["id"],
      name: map["name"],
      snippet: map["snippet"] ?? "",
      description: map["description"] ?? "",
      imageUrl: map["image_url"],
      timestamp: DateTime.parse(map["timestamp"]),
    );
  }
}
