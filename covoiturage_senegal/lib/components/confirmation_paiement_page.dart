import 'package:flutter/material.dart';

class ConfirmationPaiementPage extends StatelessWidget {
  final String moyen;

  const ConfirmationPaiementPage({super.key, required this.moyen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Confirmation de paiement')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 24),
            Text(
              'Paiment via $moyen effectué avec succès !',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed:
                  () => Navigator.popUntil(context, ModalRoute.withName('/')),
              icon: const Icon(Icons.home),
              label: const Text('Retour à l’accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
