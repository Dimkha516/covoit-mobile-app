import 'package:covoiturage_senegal/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController telController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Chauffeur uniquement:
  final TextEditingController marqueController = TextEditingController();
  final TextEditingController plaqueController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  String userType = 'passager';

  @override
  Widget build(BuildContext context) {
    final isChauffeur = userType == 'chauffeur';

    return Scaffold(
      appBar: AppBar(title: Text("Créer un compte")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextfield(label: "Nom", controller: nomController),
            CustomTextfield(label: "Prénom", controller: prenomController),
            CustomTextfield(
              label: "Téléphone",
              controller: telController,
              keyboardType: TextInputType.phone,
            ),
            CustomTextfield(
              label: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextfield(
              label: "Mot de passe",
              controller: passwordController,
              obscureText: true,
            ),

            const Text("Type d'utilisateur"),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: const Text("Passager"),
                    value: "passager",
                    groupValue: userType,
                    onChanged: (value) {
                      setState(() {
                        userType = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: const Text("Chauffeur"),
                    value: "chauffeur",
                    groupValue: userType,
                    onChanged: (value) {
                      setState(() {
                        userType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            if (isChauffeur) ...[
              CustomTextfield(
                label: "Marque véhicule",
                controller: marqueController,
              ),
              CustomTextfield(
                label: "Plaque d’immatriculation",
                controller: plaqueController,
              ),
              CustomTextfield(
                label: "Nombre de places",
                controller: placeController,
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // A COMPLETER: LOGIQUE D'INSCRIPTION
              },
              child: const Text("Créer un compte"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text("Déjà un compte ? Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
