import 'package:covoiturage_senegal/features/home_passenger/pages/my_reservations_page.dart';
import 'package:covoiturage_senegal/features/home_passenger/pages/passenger_home_page.dart';
import 'package:covoiturage_senegal/shared/pages/trip_history_page.dart';
import 'package:flutter/material.dart';

class PassengerMainPage extends StatefulWidget {
  const PassengerMainPage({super.key});

  @override
  State<PassengerMainPage> createState() => _PassengerMainPageState();
}

class _PassengerMainPageState extends State<PassengerMainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    PassengerHomePage(),
    TripHistoryPage(),
    MyReservationsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.lightBlueAccent.shade700,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Réservations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historiques',
          ),
        ],
      ),
    );
  }
}
