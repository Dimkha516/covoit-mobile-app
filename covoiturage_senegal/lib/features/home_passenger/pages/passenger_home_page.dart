import 'package:flutter/material.dart';

class PassengerHomePage extends StatelessWidget {
  const PassengerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> trips = [
      {
        "from": "Rufisque",
        "to": "Dakar",
        "date": "30 Avril",
        "price": "2 000 FCFA",
      },
      {
        "from": "Pikine",
        "to": "Médina",
        "date": "1er Mai",
        "price": "5 000 FCFA",
      },
      {"from": "Dakar", "to": "Keur.M", "date": "2 Mai", "price": "3 500 FCFA"},
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Bienvenue 👋",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Illustration ou image
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  // image: AssetImage("assets/images/localisation3.jpg"),
                  image: AssetImage("assets/images/etineraire.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bouton pour Rechercher un trajet
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/search");
                },
                icon: const Icon(Icons.search),
                label: const Text(
                  "Rechercher un trajet",
                  style: TextStyle(
                    color: Colors.white, // couleur du texte
                    fontWeight: FontWeight.bold, // style gras
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.lightBlueAccent.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              "Trajets disponibles",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: trips.length,
                itemBuilder: (context, index) {
                  final trip = trips[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.directions_car,
                        color: Colors.lightBlue,
                      ),
                      title: Text("${trip['from']} → ${trip['to']}"),
                      subtitle: Text("Date: ${trip['date']}"),
                      trailing: Text(
                        trip['price']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "/trip-detail");
                      },
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
