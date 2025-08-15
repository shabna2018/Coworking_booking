Coworking Space Booking App
A Flutter-based mobile application for browsing, viewing, and booking coworking spaces.
Features real-time updates, interactive maps, and push notifications for booking confirmations.
🚀 Features
Splash Screen – App logo with smooth navigation to Home.
Home Screen – List coworking branches with name, location, price/hour, search, and filter options.
Map View – Dynamic Google Map markers for all coworking branches.
Space Details – Images, amenities, description, and operating hours.
Booking Flow – Date/time slot selection and booking confirmation.
My Bookings – Track bookings with statuses (Upcoming/Completed).
Push Notifications – Firebase Cloud Messaging for booking success alerts.
🛠️ Tech Stack & Architecture
Flutter – UI framework
Provider – State management
Google Maps – Dynamic map markers
Firebase Cloud Messaging – Push notifications
Mock Data Models – For spaces and coordinates
Clean Architecture – Separation of UI, state, and data layers
📦 Setup Instructions
Clone the repository
git clone https://github.com/your-username/coworking-booking-app.git
cd coworking-booking-app
Install dependencies
flutter pub get
Set up Google Maps API
Enable Maps SDK for Android and Maps SDK for iOS in Google Cloud Console.
Add API keys in:
android/app/src/main/AndroidManifest.xml
ios/Runner/AppDelegate.swift (or Info.plist)
Set up Firebase
Create a Firebase project.
Add Android & iOS apps, download google-services.json (Android) and GoogleService-Info.plist (iOS), and place them in the respective platform folders.
Enable Cloud Messaging in Firebase console.
Run the app
flutter run
🗂 Feature List
Branch Listing – Search and filter coworking spaces by name, location, and price.
Interactive Map – View locations of all branches with dynamic markers.
Space Details – Rich detail view with images, amenities, and timings.
Booking Flow – Easy selection of date & time, followed by confirmation.
Booking Management – View upcoming and completed bookings.
Push Notifications – Real-time booking success alerts.
🧩 Architecture Decisions
Provider for State Management – Lightweight and suitable for small-to-medium scale projects.
Mock Data Models – Used instead of API integration for faster development and testing.
Separation of Concerns – Divided into:
UI Layer – Widgets and screens
State Layer – Providers and controllers
Data Layer – Models and mock repositories
Clean Navigation Flow – Named routes for predictable screen transitions.
⏱ Time Spent
Setup & Configuration – 1.5 hrs
UI Design & Layout – 3 hrs
State Management & Data Binding – 1.5 hrs
Google Maps Integration – 1 hr
Booking Flow & Mock Data – 1.5 hrs
Push Notifications Setup – 1 hr
Testing & Bug Fixes – 0.5 hrs
Total: ~10 hrs
🛑 Challenges Faced
Google Maps API Key Restrictions – Resolved by enabling correct SDKs.
State Synchronization – Ensured Provider updates worked correctly across multiple screens.
Firebase Notification Setup – Needed platform-specific configurations for Android & iOS.
Responsive UI – Adjusting layouts for different screen sizes.
