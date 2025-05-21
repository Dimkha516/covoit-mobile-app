import 'package:flutter/material.dart';
import 'package:covoiturage_senegal/components/profil_link_icon.dart';
import 'package:covoiturage_senegal/features/home_driver/pages/driver_trip_details_page.dart';

class DriverHomePage extends StatelessWidget {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final chauffeurData = {
      "nom": "Mamadou Sow",
      "vehicule": "Peugeot 406",
      "plaque": "DK-1234-AB",
      "note": 4.7,
      "totalPaiement": "125 000 FCFA",
      "trajets": [
        {
          "depart": "Dakar",
          "arrivee": "Kaolack",
          "date": "15 Mai 2025",
          "heure": "08:00",
          "placesDispo": 3,
        },
        {
          "depart": "Dakar",
          "arrivee": "Touba",
          "date": "16 Mai 2025",
          "heure": "15:00",
          "placesDispo": 2,
        },
      ],
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil Chauffeur"),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/profil'),
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: ProfilLinkIcon(),
            ),
          ),
        ],
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // Naviguer vers le profil chauffeur
        //     },
        //     icon: const Icon(Icons.account_circle),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👋 Bienvenue
            Text(
              "Bienvenue, ${chauffeurData["nom"]}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 🧾 Infos générales
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.directions_car, color: Colors.indigo),
                        const SizedBox(width: 8),
                        Text("Véhicule : ${chauffeurData["vehicule"]}"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.confirmation_number,
                          color: Colors.teal,
                        ),
                        const SizedBox(width: 8),
                        Text("Plaque : ${chauffeurData["plaque"]}"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 8),
                        Text("Note : ${chauffeurData["note"]}/5"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.payments, color: Colors.green),
                        const SizedBox(width: 8),
                        Text(
                          "Paiements reçus : ${chauffeurData["totalPaiement"]}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ➕ Bouton ajouter trajet
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Naviguer vers la page création de trajet
                  Navigator.pushNamed(context, "/create-trip");
                  // Navigator.pushNamed(context, "/recieved-reservations");
                  // Navigator.pushNamed(context, "/payments");
                  // Navigator.pushNamed(context, "/passenger-home-page");
                },
                icon: const Icon(Icons.add),
                label: const Text("Ajouter un trajet"),
              ),
            ),

            const SizedBox(height: 24),

            // 🚐 Liste trajets à venir
            const Text(
              "Mes trajets à venir",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Column(
              children: List.generate((chauffeurData["trajets"] as List).length, (
                index,
              ) {
                final trajet = (chauffeurData["trajets"] as List)[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                    title: Text("${trajet["depart"]} → ${trajet["arrivee"]}"),
                    subtitle: Text(
                      "Départ : ${trajet["date"]} à ${trajet["heure"]}\nPlaces disponibles : ${trajet["placesDispo"]}",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    // onTap:
                    //     () => Navigator.pushNamed(
                    //       context,
                    //       '/recieved-reservations',
                    //     ),
                    onTap: () {
                      // Naviguer vers les détails du trajet
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => DriverTripDetailsPage(
                                trajet: {
                                  'depart': 'Dakar',
                                  'arrivee': 'Thiès',
                                  'date': '22/08/2025',
                                  'heure': '09:30',
                                  'places': 3,
                                  'prix': 2500,
                                  'vehicule': {
                                    'marque': 'Toyota Corolla',
                                    'plaque': 'DK-1234-AA',
                                  },
                                  'passagers': [
                                    'Awa Diop: 771739977',
                                    'Mamadou Ndiaye: 780986755',
                                  ],
                                },
                              ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
