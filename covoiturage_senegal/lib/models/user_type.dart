import 'package:flutter/material.dart';

enum UserType {
  passager,
  chauffeur;

  String get displayName {
    switch (this) {
      case UserType.passager:
        return 'Passager';
      case UserType.chauffeur:
        return 'Chauffeur';
    }
  }

  IconData get icon {
    switch (this) {
      case UserType.passager:
        return Icons.person;
      case UserType.chauffeur:
        return Icons.drive_eta;
    }
  }
}
