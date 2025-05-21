import 'package:covoiturage_senegal/features/auth/pages/login_page.dart';
import 'package:covoiturage_senegal/features/auth/pages/onboarding_page.dart';
import 'package:covoiturage_senegal/features/auth/pages/register_page.dart';
import 'package:covoiturage_senegal/features/home_driver/pages/create_trip.dart';
import 'package:covoiturage_senegal/features/home_driver/pages/driver_home_page.dart';
import 'package:covoiturage_senegal/features/home_driver/pages/driver_reservation_details_page.dart';
import 'package:covoiturage_senegal/features/home_driver/pages/driver_trip_details_page.dart';
import 'package:covoiturage_senegal/features/home_driver/pages/recieved_reservations.dart';
import 'package:covoiturage_senegal/features/home_passenger/pages/my_reservations_page.dart';
import 'package:covoiturage_senegal/features/home_passenger/pages/passenger_home_page.dart';
import 'package:covoiturage_senegal/shared/pages/profil_page.dart';
import 'package:covoiturage_senegal/features/home_passenger/pages/reservation_confirmed.dart';
import 'package:covoiturage_senegal/features/home_passenger/pages/trip_detail_page.dart';
import 'package:covoiturage_senegal/features/payment/pages/payements_page.dart';
import 'package:covoiturage_senegal/shared/pages/trip_history_page.dart';
import 'package:flutter/material.dart';
// import 'routes/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covoiturage Sénégal",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // SAHRED ROUTES:
        '/': (context) => const OnboardingPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/passenger-home-page': (context) => const PassengerHomePage(),
        '/trip-detail': (context) => const TripDetailPage(),
        '/reservation-confirmed': (context) => const ReservationConfirmed(),
        '/my-reservations': (context) => const MyReservationsPage(),
        '/profil': (context) => const ProfilPage(),
        '/driver-home-page': (context) => const DriverHomePage(),
        '/create-trip': (context) => const CreateTrip(),
        '/recieved-reservations': (context) => const RecievedReservations(),
        '/payments': (context) => const PayementsPage(),
        '/trip_history_page': (context) => const TripHistoryPage(),
        'driver-trips': (context) => const DriverTripDetailsPage(trajet: {}),
        '/driver-reservation-details':
            (context) => const DriverReservationDetailsPage(reservation: {}),
      },
    );
  }
}
