import 'package:flutter/material.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({super.key});

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  final _formKey = GlobalKey<FormState>();
  final _villes = [
    'Rufisque',
    'Keur.Mass',
    'Pikine',
    'Dakar',
    'Parcelles',
    'Médina',
    'Guédiawaye',
    'Thiaroye',
    'Grand-Dakar',
    'Liberté 6',
    'Grand-yoff',
    'Dieupeul',
  ];

  String? depart;
  String? arrivee;
  DateTime? date;
  TimeOfDay? heure;
  int? places;
  double? prix;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Créer un trajet")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Ville de départ'),
                items:
                    _villes
                        .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                        .toList(),
                onChanged: (value) => setState(() => depart = value),
                validator:
                    (value) => value == null ? 'Sélectionnez une vliie' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Date du trajet'),
                controller: TextEditingController(
                  text:
                      date != null
                          ? "${date!.day}/${date!.month}/${date!.year}"
                          : '',
                ),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) setState(() => date = picked);
                },
                validator: (_) => date == null ? "Sélectionnez une date" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(labelText: "Heure du trajet"),
                controller: TextEditingController(
                  text: heure != null ? heure!.format(context) : '',
                ),
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) setState(() => heure = picked);
                },
                validator:
                    (_) => heure == null ? "Sélectionnez une heure" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nombre de places",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) => places = int.tryParse(value),
                validator:
                    (value) =>
                        (value == null ||
                                int.tryParse(value) == null ||
                                int.parse(value) <= 0)
                            ? "Entrez un nombre valide"
                            : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Prix par place (FCFA)",
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onChanged: (value) => prix = double.tryParse(value),
                validator:
                    (value) =>
                        (value == null ||
                                double.tryParse(value) == null ||
                                double.parse(value) <= 0)
                            ? "Entrez un prix valide"
                            : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text("Valider le trajet"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Simulation de sauvegarde ou appel API
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Trajet créé avec succès ✅"),
                      ),
                    );
                    Navigator.pop(
                      context,
                    ); // Retour à la page d’accueil chauffeur
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
