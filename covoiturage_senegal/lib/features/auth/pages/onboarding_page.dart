import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:covoiturage_senegal/features/auth/widgets/onboarding_button.dart';
import 'package:covoiturage_senegal/features/auth/widgets/onboarding_image.dart';

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

              // ANIMATION:
              Lottie.asset(
                'assets/animations/mapanimation.json',
                height: 130,
                repeat: true,
              ),
              Column(
                children: [
                  const Text(
                    "Bokko Dem",
                    // style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    style: TextStyle(fontSize: 28, fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Réservez ou proposez vos trajets en toute simplicité.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  OnboardingButton(
                    label: "Se connecter",
                    icon: Icons.login,
                    onPressed: () => Navigator.pushNamed(context, "/login"),
                  ),
                  const SizedBox(height: 12),
                  OnboardingButton(
                    label: "Créer un compte",
                    icon: Icons.person_add,
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                  ),
                ],
              ),

              // OnboardingButton(
              //   label: "Se connecter",
              //   onPressed: () => Navigator.pushNamed(context, '/login'),
              // ),
              // const SizedBox(height: 12),
              // OnboardingButton(
              //   label: "Créer un compte",
              //   onPressed: () => Navigator.pushNamed(context, '/register'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
