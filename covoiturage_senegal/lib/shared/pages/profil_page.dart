import 'package:flutter/material.dart';
import 'package:covoiturage_senegal/components/home_link_icon.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de données utilisateur simulées:
    final user = {
      "nom": "Ba",
      "prenom": "Abdoulaye",
      "email": "abdou.ba@example.com",
      "telephone": "+221 77 123 45 67",
      "role": "chauffeur",
      "vehicule": "Toyota Yaris",
      "plaque": "DK-1234-AB",
      "places": 4,
      "note": 4.5,
      "totalPaiement": "45 000 FCFA",
    };

    bool isDriver = user["role"] == "chauffeur";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil utilisateur"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/passenger-home-page'),
            // Ajouter une vérification du profil pour redirection vers homePassenger ou Driver Passanger
            child: const Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: HomeLinkIcon(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "${user["prenom"]} ${user["nom"]}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${user["email"]}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "${user["telephone"]}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Chip(label: Text("Rôle: ${user["role"]}")),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (isDriver) ...[
              const Divider(),
              const Text(
                "Informations véhicule",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.directions_car),
                title: Text("${user["vehicule"]}"),
                subtitle: Text("Plaque: ${user["plaque"]}"),
                trailing: Text("${user["places"]} places"),
              ),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(Icons.star, color: Colors.amber),
                title: const Text("Note Moyenne"),
                trailing: Text("${user["note"]}/5"),
              ),
              ListTile(
                leading: const Icon(Icons.payments),
                title: const Text("Paiements reçus"),
                trailing: Text("${user["totalPaiement"]}"),
              ),
            ],
            const Divider(),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Historique des trajets"),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.pushNamed(context, '/trip_history_page'),
            ),
            const Divider(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Déconnexion future
              },
              icon: const Icon(Icons.logout),
              label: const Text("Se déconnecter"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
