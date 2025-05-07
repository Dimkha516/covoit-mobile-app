import 'package:flutter/material.dart';
import 'package:covoiturage_senegal/components/trip_info_card.dart';

class TripDetailPage extends StatelessWidget {
  const TripDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de données (normalement transmises en argument ou via provider)
    final Map<String, dynamic> trip = {
      "from": "Dakar",
      "to": "Thiès",
      "date": "30 Avril 2025",
      "time": "08h00",
      "driver": "Aliou Ndiaye",
      "price": "2 000 FCFA",
      "places": 3,
      "car": "Peugeot 406 - DK 1234 AZ",
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Détail du trajet"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TripInfoCard(trip: trip),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/reservation-confirmed");
                },
                child: const Text("Réserver ce trajet"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent.shade700,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
