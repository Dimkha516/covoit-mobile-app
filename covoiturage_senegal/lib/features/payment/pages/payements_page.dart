import 'package:covoiturage_senegal/components/confirmation_paiement_page.dart';
import 'package:flutter/material.dart';

class PayementsPage extends StatelessWidget {
  const PayementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> moyensPaiement = [
      {
        'nom': 'Wave',
        'image': 'assets/images/wave1.png',
        'codeCouleur': Colors.blue[800],
      },
      {
        'nom': 'Orange Money',
        'image': 'assets/images/om1.png',
        'codeCouleur': Colors.orange[700],
      },
      {
        'nom': 'Espèces',
        'image': 'assets/images/especes1.jpg',
        'codeCouleur': Colors.orange[700],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Paiement'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sélectionnez un moyen de paiement',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...moyensPaiement.map(
              (moyen) => PaiementOptionButton(
                nom: moyen['nom'],
                image: moyen['image'],
                couleur: moyen['codeCouleur'],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => ConfirmationPaiementPage(moyen: moyen['nom']),
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

class PaiementOptionButton extends StatelessWidget {
  final String nom;
  final String image;
  final Color? couleur;
  final VoidCallback onPressed;

  const PaiementOptionButton({
    required this.nom,
    required this.image,
    required this.couleur,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: couleur?.withOpacity(0.1),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Image.asset(image, width: 40),
        title: Text(nom, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onPressed,
      ),
    );
  }
}
