import 'package:covoiturage_senegal/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool rememberMe = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 60),

                _buildHeader(primaryColor),
                const SizedBox(height: 40),

                CustomTextfield(
                  controller: phoneController,
                  label: "Téléphone",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),

                CustomTextfield(
                  controller: passwordController,
                  label: "Mot de passe",
                  prefixIcon: Icons.lock,
                  obscureText: !isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),

                _buildOptionsRow(),
                const SizedBox(height: 30),

                _buildLoginButton(primaryColor),
                const SizedBox(height: 20),

                _buildDivider(),
                const SizedBox(height: 20),

                _buildRegisterLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Color primaryColor) {
    return Column(
      children: [
        // Logo ou icône d'application
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            // color: primaryColor.withValues(),
            color: primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.person, size: 50, color: primaryColor),
        ),
        const SizedBox(height: 24),
        // Titre et sous-titre
        const Text(
          "Connexion",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildOptionsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Option "Se souvenir de moi"
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (value) {
                setState(() {
                  rememberMe = value ?? false;
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Text("Se souvenir de moi"),
          ],
        ),
        // Mot de passe oublié
        TextButton(
          onPressed: () {
            // Navigation vers la page de récupération de mot de passe
          },
          child: const Text(
            "Mot de passe oublié?",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(Color primaryColor) {
    return ElevatedButton(
      onPressed: () {
        // LOGIQUE DE CONNEXION PLUS TARD
        Navigator.pushNamed(context, '/passenger-home-page');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        "SE CONNECTER",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "OU",
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(child: Divider(thickness: 1, color: Colors.grey[300])),
      ],
    );
  }

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Vous n'avez pas de compte?",
          style: TextStyle(color: Colors.grey[600]),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: const Text(
            "S'inscrire",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool isPasswordVisible = false;
//   bool rememberMe = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const SizedBox(height: 60),
//                 // Logo ou icône d'application
//                 Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     // color: Theme.of(context).primaryColor.withOpacity(0.1),
//                     color: Theme.of(context).primaryColor.withValues(),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.person,
//                     size: 50,
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 // Titre et sous-titre
//                 const Text(
//                   "Connexion",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 0.5,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "Entrez vos informations pour vous connecter",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                 ),
//                 const SizedBox(height: 40),
//                 // Champ téléphone avec design amélioré
//                 TextField(
//                   controller: phoneController,
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(
//                     labelText: "Téléphone",
//                     hintText: "Entrez votre numéro",
//                     prefixIcon: const Icon(Icons.phone),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: Theme.of(context).primaryColor,
//                         width: 2,
//                       ),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Champ mot de passe avec design amélioré
//                 TextField(
//                   controller: passwordController,
//                   obscureText: !isPasswordVisible,
//                   decoration: InputDecoration(
//                     labelText: "Mot de passe",
//                     hintText: "Entrez votre mot de passe",
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           isPasswordVisible = !isPasswordVisible;
//                         });
//                       },
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: BorderSide(
//                         color: Theme.of(context).primaryColor,
//                         width: 2,
//                       ),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 16),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 // Options supplémentaires
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Option "Se souvenir de moi"
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: rememberMe,
//                           onChanged: (value) {
//                             setState(() {
//                               rememberMe = value ?? false;
//                             });
//                           },
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                         ),
//                         const Text("Se souvenir de moi"),
//                       ],
//                     ),
//                     // Mot de passe oublié
//                     TextButton(
//                       onPressed: () {
//                         // Navigation vers la page de récupération de mot de passe
//                       },
//                       child: const Text(
//                         "Mot de passe oublié?",
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 // Bouton de connexion amélioré
//                 ElevatedButton(
//                   onPressed: () {
//                     // LOGIQUE DE CONNEXION PLUS TARD
//                     Navigator.pushNamed(context, '/passenger-home-page');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     foregroundColor: Colors.white,
//                     elevation: 2,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     "SE CONNECTER",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 // Séparateur ou
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Divider(thickness: 1, color: Colors.grey[300]),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       child: Text(
//                         "OU",
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Divider(thickness: 1, color: Colors.grey[300]),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 // Lien d'inscription amélioré
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Vous n'avez pas de compte?",
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pushNamed(context, '/register');
//                       },
//                       child: const Text(
//                         "S'inscrire",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
