import 'package:covoiturage_senegal/features/auth/widgets/onboarding_button.dart';
import 'package:covoiturage_senegal/features/auth/widgets/onboarding_image.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const OnboardingImage(),
              const Column(
                children: const [
                  Text(
                    "Bienvenue sur EasyCovoit",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Réservez ou proposez vos trajets en toute simplicité.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              OnboardingButton(
                label: "Se connecter",
                onPressed: () => Navigator.pushNamed(context, '/login'),
              ),
              const SizedBox(height: 12),
              OnboardingButton(
                label: "Créer un compte",
                onPressed: () => Navigator.pushNamed(context, '/register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
