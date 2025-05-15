import 'package:flutter/material.dart';
import 'package:covoiturage_senegal/components/reservations_card.dart';
import 'package:covoiturage_senegal/components/profil_link_icon.dart';

class MyReservationsPage extends StatelessWidget {
  const MyReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de données fictives
    final reservations = [
      {
        "depart": "Rufisque",
        "destination": "DK-plateau",
        "date": "1 Mai 2025",
        "heure": "07h00",
        "statut": "Confirmée",
      },
      {
        "depart": "Keur.mass",
        "destination": "Médina",
        "date": "2 Mai 2025",
        "heure": "09h30",
        "statut": "En attente",
      },

      {
        "depart": "Parcelles",
        "destination": "Grand-Dakar",
        "date": "2 Mai 2025",
        "heure": "09h30",
        "statut": "Annulée",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes réservations"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profil'),
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: ProfilLinkIcon(),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return ReservationsCard(
            depart: reservation["depart"]!,
            destination: reservation["destination"]!,
            date: reservation["date"]!,
            heure: reservation["heure"]!,
            statut: reservation["statut"]!,
          );
        },
      ),
    );
  }
}
