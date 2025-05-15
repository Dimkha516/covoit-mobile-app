import 'package:flutter/material.dart';

class TripDetailBottomSheet extends StatelessWidget {
  final Map trip;

  const TripDetailBottomSheet({super.key, required this.trip});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        runSpacing: 16,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text(
            "${trip["depart"]} → ${trip["arrivee"]}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.blue),
              const SizedBox(width: 8),
              Text("Départ : ${trip["heure"]}, ${trip["date"]}"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.person, color: Colors.black54),
              const SizedBox(width: 8),
              Text("Chauffeur : ${trip["chauffeur"]}"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.directions_car, color: Colors.indigo),
              const SizedBox(width: 8),
              Text("Véhicule : ${trip["vehicule"]}"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 8),
              Text("Note du chauffeur : ${trip["note"]}/5"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.payment, color: Colors.green),
              const SizedBox(width: 8),
              Text("Montant payé : ${trip["prix"]}"),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.event_seat_outlined, color: Colors.deepOrange),
              const SizedBox(width: 8),
              Text("Places réservées : ${trip["places"]}"),
            ],
          ),
        ],
      ),
    );
  }
}
