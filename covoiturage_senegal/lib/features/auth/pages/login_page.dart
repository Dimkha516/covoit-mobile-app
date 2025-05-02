import 'package:covoiturage_senegal/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController passwordController TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Connexion",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 40),
              CustomTextfield(
                label: "Téléphone",
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              CustomTextfield(
                label: "Mot de passe",
                controller: passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  // LOGIQUE DE CONNEXION PLUS TARD
                },
                child: const Text("Se connecter"),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text("S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
