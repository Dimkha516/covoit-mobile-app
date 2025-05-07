import 'package:flutter/material.dart';

class TripSummary extends StatelessWidget {
  const TripSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            _DetailRow(label: "Départ", value: "Dakar"),
            _DetailRow(label: "Destination", value: "Thies"),
            _DetailRow(label: "Date", value: "30 Avril 2025"),
            _DetailRow(label: "Heure", value: "08h00"),
            _DetailRow(label: "Prix", value: "2 000 FCFA"),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
