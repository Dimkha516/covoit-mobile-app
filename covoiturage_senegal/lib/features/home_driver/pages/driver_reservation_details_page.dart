import "package:flutter/material.dart";

class DriverReservationDetailsPage extends StatelessWidget {
  final Map<String, dynamic> reservation;

  const DriverReservationDetailsPage({super.key, required this.reservation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Détails de la réservation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoRow(label: "Passager", value: reservation["passager"]),
            InfoRow(label: "Trajet", value: reservation["trajet"]),
            InfoRow(label: "Date", value: reservation["date"]),
            InfoRow(label: "Heure", value: reservation["heure"]),
            InfoRow(
              label: "Places réservées",
              value: reservation["places"].toString(),
            ),
            InfoRow(label: 'Statut', value: reservation["statut"]),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.check),
              label: const Text("Retour"),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value)],
      ),
    );
  }
}
