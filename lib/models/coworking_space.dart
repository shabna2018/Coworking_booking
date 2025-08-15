class CoworkingSpace {
  final String id;
  final String name;
  final String location;
  final String city;
  final double pricePerHour;
  final List<String> images;
  final String description;
  final List<String> amenities;
  final String operatingHours;
  final double latitude;
  final double longitude;
  final double rating;
  final int totalReviews;

  CoworkingSpace({
    required this.id,
    required this.name,
    required this.location,
    required this.city,
    required this.pricePerHour,
    required this.images,
    required this.description,
    required this.amenities,
    required this.operatingHours,
    required this.latitude,
    required this.longitude,
    this.rating = 0.0,
    this.totalReviews = 0,
  });

  factory CoworkingSpace.fromJson(Map<String, dynamic> json) {
    return CoworkingSpace(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      city: json['city'] ?? '',
      pricePerHour: (json['pricePerHour'] ?? 0).toDouble(),
      images: List<String>.from(json['images'] ?? []),
      description: json['description'] ?? '',
      amenities: List<String>.from(json['amenities'] ?? []),
      operatingHours: json['operatingHours'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      totalReviews: json['totalReviews'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'city': city,
      'pricePerHour': pricePerHour,
      'images': images,
      'description': description,
      'amenities': amenities,
      'operatingHours': operatingHours,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'totalReviews': totalReviews,
    };
  }
}
