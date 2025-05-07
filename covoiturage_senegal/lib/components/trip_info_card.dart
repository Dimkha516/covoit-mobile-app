import 'package:flutter/material.dart';

class TripInfoCard extends StatelessWidget {
  final Map<String, dynamic> trip;

  const TripInfoCard({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _infoRow(Icons.location_on, "${trip['from']} → ${trip['to']}"),
            _infoRow(Icons.calendar_today, "Date: ${trip['date']}"),
            _infoRow(Icons.access_time, "Heure: ${trip['time']}"),
            _infoRow(Icons.person, "Conducteur: ${trip['driver']}"),
            _infoRow(Icons.directions_car, "Véhicule: ${trip['car']}"),
            _infoRow(Icons.chair, "Places dispo: ${trip['places']}"),
            _infoRow(Icons.attach_money, "Prix: ${trip['price']}"),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.lightBlue),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
