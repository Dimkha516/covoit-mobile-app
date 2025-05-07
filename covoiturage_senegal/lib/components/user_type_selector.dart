import 'package:flutter/material.dart';
// import 'package:covoiturage_senegal/models/user_type.dart';

class UserTypeSelector extends StatelessWidget {
  final String userType;
  final Function(String) onChanged;

  const UserTypeSelector({
    super.key,
    required this.userType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          RadioListTile<String>(
            title: Row(
              children: [
                Icon(Icons.person, color: primaryColor),
                const SizedBox(width: 12),
                const Text(
                  "Passager",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            value: "passager",
            groupValue: userType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            activeColor: primaryColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
          RadioListTile<String>(
            title: Row(
              children: [
                Icon(Icons.drive_eta, color: primaryColor),
                const SizedBox(width: 12),
                const Text(
                  "Chauffeur",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            value: "chauffeur",
            groupValue: userType,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            activeColor: primaryColor,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 4,
            ),
          ),
        ],
      ),
    );
  }
}
