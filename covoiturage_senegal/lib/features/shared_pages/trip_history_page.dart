import 'package:covoiturage_senegal/components/trip_detail_bottom_sheet.dart';
import 'package:flutter/material.dart';

class TripHistoryPage extends StatelessWidget {
  const TripHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Données history simulées:
    final tripHistory = [
      {
        "date": "12 Avril 2025",
        "depart": "Dakar",
        "arrivee": "Thiès",
        "heure": "14:00",
        "prix": "2 500 FCFA",
        "places": 2,
        "chauffeur": "Mamadou Ndiaye",
        "vehicule": "Peugeot 406",
        "note": 4.8,
      },
      {
        "date": "04 Avril 2025",
        "depart": "Dakar",
        "arrivee": "Saint-Louis",
        "heure": "08:30",
        "prix": "5 000 FCFA",
        "places": 1,
        "chauffeur": "Fatou Diop",
        "vehicule": "Toyota Avensis",
        "note": 4.9,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique des trajets"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Champ de recherche
            TextField(
              decoration: InputDecoration(
                hintText: "Rechercher un trajet...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 📅 Filtre par date
            TextField(
              decoration: InputDecoration(
                hintText: "Filtrer par date...",
                prefixIcon: const Icon(Icons.date_range),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🧾 Liste des trajets
            Expanded(
              child: ListView.separated(
                itemCount: tripHistory.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final trip = tripHistory[index];
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        // builder: (_) => TripDetailBott(trip: trip),
                        builder: (_) => TripDetailBottomSheet(trip: trip),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${trip["date"]}",
                              // trip["date"] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "${trip["depart"]} → ${trip["arrivee"]}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time_rounded,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(width: 8),
                                Text("Départ à ${trip["heure"]}"),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.event_seat,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${trip["places"]} place(s) réservée(s)",
                                    ),
                                  ],
                                ),
                                Text(
                                  // trip["prix"] ?? '',
                                  "${trip["prix"]}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
