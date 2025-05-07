import 'package:covoiturage_senegal/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class VehicleInfoForm extends StatelessWidget {
  final TextEditingController marqueController;
  final TextEditingController plaqueController;
  final TextEditingController placeController;

  const VehicleInfoForm({
    super.key,
    required this.marqueController,
    required this.plaqueController,
    required this.placeController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextfield(
          controller: marqueController,
          label: "Marque et modèle du véhicule",
          prefixIcon: Icons.directions_car,
          helperText: "Ex: Renault Clio, Peugeot 208",
        ),
        const SizedBox(height: 16),

        CustomTextfield(
          controller: plaqueController,
          label: "Plaque d'immatriculation",
          prefixIcon: Icons.confirmation_num_outlined,
          textCapitalization: TextCapitalization.characters,
          helperText: "Format: DK 1930 AA",
        ),
        const SizedBox(height: 16),

        CustomTextfield(
          controller: placeController,
          label: "Nombre de place",
          prefixIcon: Icons.event_seat,
          keyboardType: TextInputType.number,
          helperText: "Sans compter le conducteur",
        ),
      ],
    );
  }
}
