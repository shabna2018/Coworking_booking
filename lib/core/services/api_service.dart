import 'dart:async';
import 'package:coworking_app/models/booking.dart';
import 'package:coworking_app/models/coworking_space.dart';
import 'package:coworking_app/models/notification.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final List<CoworkingSpace> _mockSpaces = [
    CoworkingSpace(
      id: '1',
      name: 'WeWork Hub',
      location: 'Marine Drive, Ernakulam, Kochi',
      city: 'Kochi',
      pricePerHour: 500.0,
      images: [
        'https://images.unsplash.com/photo-1497366216548-37526070297c?w=500',
        'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=500',
      ],
      description:
          'Modern coworking space with all amenities in the heart of Kochi.',
      amenities: ['WiFi', 'Coffee', 'Meeting Rooms', 'Parking', 'AC'],
      operatingHours: '9:00 AM - 9:00 PM',
      latitude: 9.9312,
      longitude: 76.2673,
      rating: 4.5,
      totalReviews: 120,
    ),
    CoworkingSpace(
      id: '2',
      name: 'Tech Valley',
      location: 'Infopark, Kakkanad, Kochi',
      city: 'Kochi',
      pricePerHour: 400.0,
      images: [
        'https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=500',
      ],
      description: 'Perfect space for tech professionals and startups.',
      amenities: ['WiFi', 'Cafeteria', 'Gaming Zone', '24/7 Access'],
      operatingHours: '24/7',
      latitude: 10.5276,
      longitude: 76.2144,
      rating: 4.2,
      totalReviews: 89,
    ),
    CoworkingSpace(
      id: '3',
      name: 'Creative Hub',
      location: 'Alappuzha Junction, Alappuzha',
      city: 'Alappuzha',
      pricePerHour: 350.0,
      images: [
        'https://images.unsplash.com/photo-1497366412874-3415097a27e7?w=500',
      ],
      description: 'Inspiring workspace for creative professionals.',
      amenities: ['WiFi', 'Printing', 'Art Supplies', 'Natural Light'],
      operatingHours: '8:00 AM - 8:00 PM',
      latitude: 9.4981,
      longitude: 76.3388,
      rating: 4.0,
      totalReviews: 67,
    ),
  ];

  final List<Booking> _mockBookings = [];
  final List<AppNotification> _mockNotifications = [];

  Future<List<CoworkingSpace>> getSpaces({
    String? searchQuery,
    String? cityFilter,
    double? maxPrice,
  }) async {
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay

    List<CoworkingSpace> filteredSpaces = List.from(_mockSpaces);

    if (searchQuery != null && searchQuery.isNotEmpty) {
      filteredSpaces = filteredSpaces
          .where(
            (space) =>
                space.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                space.city.toLowerCase().contains(searchQuery.toLowerCase()) ||
                space.location.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }

    if (cityFilter != null && cityFilter.isNotEmpty) {
      filteredSpaces = filteredSpaces
          .where(
            (space) => space.city.toLowerCase() == cityFilter.toLowerCase(),
          )
          .toList();
    }

    if (maxPrice != null) {
      filteredSpaces = filteredSpaces
          .where((space) => space.pricePerHour <= maxPrice)
          .toList();
    }

    return filteredSpaces;
  }

  Future<CoworkingSpace?> getSpaceById(String id) async {
    await Future.delayed(Duration(milliseconds: 300));
    return _mockSpaces.firstWhere((space) => space.id == id);
  }

  Future<Booking> createBooking(Booking booking) async {
    await Future.delayed(Duration(milliseconds: 800));

    final newBooking = Booking(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      spaceId: booking.spaceId,
      spaceName: booking.spaceName,
      spaceLocation: booking.spaceLocation,
      bookingDate: booking.bookingDate,
      timeSlot: booking.timeSlot,
      totalAmount: booking.totalAmount,
      status: BookingStatus.upcoming,
      createdAt: DateTime.now(),
    );

    _mockBookings.add(newBooking);

    _mockNotifications.add(
      AppNotification(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Booking Confirmed',
        body: 'Your booking for ${booking.spaceName} has been confirmed.',
        type: NotificationType.booking,
        createdAt: DateTime.now(),
      ),
    );

    return newBooking;
  }

  Future<List<Booking>> getBookings() async {
    await Future.delayed(Duration(milliseconds: 400));
    return List.from(_mockBookings);
  }

  Future<List<AppNotification>> getNotifications() async {
    await Future.delayed(Duration(milliseconds: 300));
    return List.from(_mockNotifications);
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    await Future.delayed(Duration(milliseconds: 200));
    final index = _mockNotifications.indexWhere((n) => n.id == notificationId);
    if (index != -1) {
      _mockNotifications[index] = AppNotification(
        id: _mockNotifications[index].id,
        title: _mockNotifications[index].title,
        body: _mockNotifications[index].body,
        type: _mockNotifications[index].type,
        createdAt: _mockNotifications[index].createdAt,
        isRead: true,
        data: _mockNotifications[index].data,
      );
    }
  }

  List<String> getCities() {
    return _mockSpaces.map((space) => space.city).toSet().toList();
  }
}
