import 'package:lottie/lottie.dart';

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

              // 👉 ANIMATION AJOUTÉE ICI
              Lottie.asset(
                'assets/animations/car.json',
                height: 120,
                repeat: true,
              ),

              const Column(
                children: [
                  Text(
                    "Bokko Dem",
                    style: TextStyle(fontSize: 28, fontFamily: 'RobotoMono'),
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

              Column(
                children: [
                  OnboardingButton(
                    label: "Se connecter",
                    icon: Icons.login,
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                  ),
                  const SizedBox(height: 8),
                  OnboardingButton(
                    label: "Créer un compte",
                    icon: Icons.person_add,
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
