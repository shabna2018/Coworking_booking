enum BookingStatus { upcoming, completed, cancelled }

class Booking {
  final String id;
  final String spaceId;
  final String spaceName;
  final String spaceLocation;
  final DateTime bookingDate;
  final String timeSlot;
  final double totalAmount;
  final BookingStatus status;
  final DateTime createdAt;

  Booking({
    required this.id,
    required this.spaceId,
    required this.spaceName,
    required this.spaceLocation,
    required this.bookingDate,
    required this.timeSlot,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] ?? '',
      spaceId: json['spaceId'] ?? '',
      spaceName: json['spaceName'] ?? '',
      spaceLocation: json['spaceLocation'] ?? '',
      bookingDate: DateTime.parse(json['bookingDate']),
      timeSlot: json['timeSlot'] ?? '',
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      status: BookingStatus.values.firstWhere(
        (e) => e.toString() == 'BookingStatus.${json['status']}',
        orElse: () => BookingStatus.upcoming,
      ),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'spaceId': spaceId,
      'spaceName': spaceName,
      'spaceLocation': spaceLocation,
      'bookingDate': bookingDate.toIso8601String(),
      'timeSlot': timeSlot,
      'totalAmount': totalAmount,
      'status': status.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
