import 'package:coworking_app/core/constants/app_colors.dart';
import 'package:coworking_app/core/constants/app_routes.dart';
import 'package:coworking_app/core/services/notification_service.dart';
import 'package:coworking_app/providers/booking_provider.dart';
import 'package:coworking_app/providers/notification_provider.dart';
import 'package:coworking_app/providers/spaces_provider.dart';
import 'package:coworking_app/screens/booking_screen.dart';
import 'package:coworking_app/screens/home_screen.dart';
import 'package:coworking_app/screens/map_screen.dart';
import 'package:coworking_app/screens/my_bookings_screen.dart';
import 'package:coworking_app/screens/notifications_screen.dart';
import 'package:coworking_app/screens/space_detail_screen.dart';
import 'package:coworking_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationService().initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SpacesProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CoWork Booking',
        theme: ThemeData(
          primarySwatch: AppColors.primaryMaterialColor,
          primaryColor: AppColors.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // Add the navigator key here
        navigatorKey: NotificationService.navigatorKey,
        initialRoute: AppRoutes.splash,
        routes: {
          AppRoutes.splash: (context) => SplashScreen(),
          AppRoutes.home: (context) => HomeScreen(),
          AppRoutes.map: (context) => MapScreen(),
          AppRoutes.spaceDetail: (context) => SpaceDetailScreen(),
          AppRoutes.booking: (context) => BookingScreen(),
          AppRoutes.myBookings: (context) => MyBookingsScreen(),
          AppRoutes.notifications: (context) => NotificationsScreen(),
        },
      ),
    );
  }
}
