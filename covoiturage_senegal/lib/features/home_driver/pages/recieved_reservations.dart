import 'package:covoiturage_senegal/features/home_driver/pages/driver_reservation_details_page.dart';
import 'package:flutter/material.dart';

class RecievedReservations extends StatelessWidget {
  const RecievedReservations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reservations = [
      {
        'passager': 'Awa Diop',
        'trajet': 'Rufisque → Dakar',
        'date': '22/08/2025',
        'heure': '09:30',
        'places': 2,
        'statut': 'Confirmée',
      },
      {
        'passager': 'Mamadou Ndiaye',
        'trajet': 'Parcelles → Sacré-Cœur',
        'date': '23/08/2025',
        'heure': '14:00',
        'places': 1,
        'statut': 'En attente',
      },
    ];
    // Nous sommes entrain de travailler avec les services de renseignements. Nous aurons très bientôt leur retour pour une
    // Meilleure prise en charge de la question.

    return Scaffold(
      appBar: AppBar(title: const Text("Réservations reçues")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: reservations.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final res = reservations[index];
          return Card(
            elevation: 3,
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(res['passager']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trajet: ${res['trajet']}'),
                  Text('Date: ${res['date']} à ${res['heure']}'),
                  Text('Places réservées: ${res['places']}'),
                  Text(
                    'Statut: ${res['statut']}',
                    style: TextStyle(
                      color:
                          res['statut'] == 'Confirmée'
                              ? Colors.green
                              : Colors.orange,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => DriverReservationDetailsPage(reservation: res),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
