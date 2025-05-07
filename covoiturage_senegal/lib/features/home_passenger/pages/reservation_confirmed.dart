import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:covoiturage_senegal/components/trip_summary.dart';

class ReservationConfirmed extends StatelessWidget {
  const ReservationConfirmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Confirmation"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Réduit un peu le padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Lottie.asset(
              "assets/animations/confirmanimation2.json",
              height: 110,
              repeat: true,
            ),
            // Icon(Icons.check_circle, color: Colors.lightBlue, size: 80),
            const SizedBox(height: 12),
            const Text(
              "Réservation Confirmée !",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Votre place a été réservée avec succès. Vous recevrez les informations du conducteur sous peu",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            TripSummary(),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/my-reservations");
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   "/my-reservations",
                //   (_) => false,
                // );
              },
              icon: const Icon(Icons.home),
              label: const Text("Accueil"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent.shade700,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/my-reservations");
              },
              child: const Text("Mes Réservations"),
            ),
          ],
        ),
      ),
    );
  }
}
