import 'package:flutter/material.dart';

class ReservationsCard extends StatelessWidget {
  const ReservationsCard({
    super.key,
    required this.depart,
    required this.destination,
    required this.date,
    required this.heure,
    required this.statut,
  });

  final String depart;
  final String destination;
  final String date;
  final String heure;
  final String statut;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          "$depart ➜ $destination",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text("Date: $date"),
            Text("Heure: $heure"),
            Text(
              "Statut: $statut",
              style: TextStyle(
                color:
                    statut == "Confirmée"
                        ? Colors.green
                        : statut == "Annulée"
                        ? Colors.red
                        : Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),

            // Text(
            //   "Statut: $statut",
            //   style: TextStyle(
            //     color: statut == "Confirmée" ? Colors.green : Colors.orange,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),
          ],
        ),
        onTap: () {
          // Redirection vers la réservation pour actions(annuler par exemple)
        },
      ),
    );
  }
}
