import 'package:covoiturage_senegal/features/auth/pages/login_page.dart';
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
import 'package:go_router/go_router.dart';
import 'package:covoiturage_senegal/features/auth/pages/onboarding_page.dart';
// import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  routes: [
    //-------------------------AUTH
    GoRoute(path: '/', builder: (context, state) => const OnboardingPage()),
    GoRoute(path: '/login', builder: (context, state) => LoginPage()),
    GoRoute(path: '/register', builder: (context, state) => RegisterPage()),

    //-------------------------PASSENGER
    GoRoute(
      path: '/passenger-home-page',
      builder: (context, state) => const PassengerHomePage(),
    ),
    GoRoute(
      path: '/trip-detail',
      builder: (context, state) => const TripDetailPage(),
    ),
    GoRoute(
      path: '/reservation-confirmed',
      builder: (context, state) => const ReservationConfirmed(),
    ),
    GoRoute(
      path: '/my-reservations',
      builder: (context, state) => const MyReservationsPage(),
    ),
    GoRoute(path: '/profil', builder: (context, state) => const ProfilPage()),

    //-------------------------DRIVER
    GoRoute(
      path: '/driver-home-page',
      builder: (context, state) => const DriverHomePage(),
    ),
    GoRoute(
      path: '/create-trip',
      builder: (context, state) => const CreateTrip(),
    ),

    GoRoute(
      path: '/recieved-reservations',
      builder: (context, state) => const RecievedReservations(),
    ),

    //-------------------------PAYEMENTS
    GoRoute(
      path: '/payments',
      builder: (context, state) => const PayementsPage(),
    ),

    //-------------------------TRIPS HISTORY
    GoRoute(
      path: '/trip_history_page',
      builder: (context, state) => const TripHistoryPage(),
    ),

    //-------------------------TRIPS INFOS (Côté chauffeur)
    GoRoute(
      path: '/driver-trips',
      builder: (context, state) => const DriverTripDetailsPage(trajet: {}),
    ),

    //-------------------------RESERVATIONS DETAILS (Côté chauffeur)
    GoRoute(
      path: '/driver-reservation-details',
      builder:
          (context, state) =>
              const DriverReservationDetailsPage(reservation: {}),
    ),
  ],
);
