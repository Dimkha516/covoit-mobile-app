import 'package:flutter/material.dart';
import '/components/form_section_title.dart';
import '/components/custom_text_field.dart';
import '/components/user_type_selector.dart';
import '/components/vehicle_info_form.dart';
import '/components/terms_checkbox.dart';
// import '/models/user_type.dart';

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
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Chauffeur uniquement:
  final TextEditingController marqueController = TextEditingController();
  final TextEditingController plaqueController = TextEditingController();
  final TextEditingController placeController = TextEditingController();

  String userType = 'passager';
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool acceptTerms = false;

  @override
  void dispose() {
    // Libérer les contrôleurs pour éviter les fuites de mémoire
    nomController.dispose();
    prenomController.dispose();
    telController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    marqueController.dispose();
    plaqueController.dispose();
    placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isChauffeur = userType == 'chauffeur';
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Créer un compte",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // En-tête avec icône
            _buildHeader(primaryColor),
            const SizedBox(height: 30),

            // Section des informations personnelles
            const FormSectionTitle(title: "Informations personnelles"),
            const SizedBox(height: 16),

            // Champs nom et prénom sur la même ligne
            _buildNameFields(),
            const SizedBox(height: 16),

            CustomTextfield(
              controller: telController,
              label: "Téléphone",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),

            CustomTextfield(
              controller: emailController,
              label: "Email",
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            _buildPasswordFields(),
            const SizedBox(height: 24),

            // Section type d'utilisateur
            const FormSectionTitle(title: "Type d'utilisateur"),
            const SizedBox(height: 8),

            UserTypeSelector(
              userType: userType,
              onChanged: (value) {
                setState(() {
                  userType = value;
                });
              },
            ),

            // Informations du véhicule si chauffeur
            if (isChauffeur) ...[
              const SizedBox(height: 24),
              const FormSectionTitle(title: "Informations du véhicule"),
              const SizedBox(height: 16),

              VehicleInfoForm(
                marqueController: marqueController,
                plaqueController: plaqueController,
                placeController: placeController,
              ),
            ],

            const SizedBox(height: 24),

            // Case à cocher pour les conditions d'utilisation
            TermsCheckbox(
              value: acceptTerms,
              onChanged: (value) {
                setState(() {
                  acceptTerms = value ?? false;
                });
              },
            ),

            const SizedBox(height: 30),

            // Bouton d'inscription
            _buildRegisterButton(primaryColor),

            const SizedBox(height: 20),

            // Lien vers la page de connexion
            _buildLoginLink(primaryColor),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color primaryColor) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.app_registration_rounded,
              size: 40,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Créez votre compte",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Remplissez le formulaire pour vous inscrire",
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: CustomTextfield(
            controller: nomController,
            label: "Nom",
            prefixIcon: Icons.person_outline,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomTextfield(
            controller: prenomController,
            label: "Prénom",
            prefixIcon: Icons.person_outline,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      children: [
        CustomTextfield(
          controller: passwordController,
          label: "Mot de passe",
          prefixIcon: Icons.lock_outline,
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        CustomTextfield(
          controller: confirmPasswordController,
          label: "Confirmer le mot de passe",
          prefixIcon: Icons.lock_outline,
          obscureText: !isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton(Color primaryColor) {
    return ElevatedButton(
      onPressed: () {
        // A COMPLETER: LOGIQUE D'INSCRIPTION
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
      child: const Text(
        "CRÉER MON COMPTE",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildLoginLink(Color primaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Déjà un compte ?", style: TextStyle(color: Colors.grey[600])),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text(
            "Se connecter",
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   final TextEditingController nomController = TextEditingController();
//   final TextEditingController prenomController = TextEditingController();
//   final TextEditingController telController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   // Chauffeur uniquement:
//   final TextEditingController marqueController = TextEditingController();
//   final TextEditingController plaqueController = TextEditingController();
//   final TextEditingController placeController = TextEditingController();

//   String userType = 'passager';
//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;
//   bool acceptTerms = false;

//   @override
//   Widget build(BuildContext context) {
//     final isChauffeur = userType == 'chauffeur';
//     final primaryColor = Theme.of(context).primaryColor;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Créer un compte",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black87,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const SizedBox(height: 20),
//             // En-tête avec icône
//             Center(
//               child: Column(
//                 children: [
//                   Container(
//                     height: 80,
//                     width: 80,
//                     decoration: BoxDecoration(
//                       color: primaryColor.withOpacity(0.1),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       Icons.app_registration_rounded,
//                       size: 40,
//                       color: primaryColor,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     "Créez votre compte",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     "Remplissez le formulaire pour vous inscrire",
//                     style: TextStyle(color: Colors.grey[600], fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),

//             // Section des informations personnelles
//             _buildSectionTitle("Informations personnelles"),
//             const SizedBox(height: 16),

//             // Champs nom et prénom sur la même ligne
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField(
//                     controller: nomController,
//                     label: "Nom",
//                     prefixIcon: Icons.person_outline,
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: _buildTextField(
//                     controller: prenomController,
//                     label: "Prénom",
//                     prefixIcon: Icons.person_outline,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             _buildTextField(
//               controller: telController,
//               label: "Téléphone",
//               prefixIcon: Icons.phone,
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 16),

//             _buildTextField(
//               controller: emailController,
//               label: "Email",
//               prefixIcon: Icons.email_outlined,
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 16),

//             _buildTextField(
//               controller: passwordController,
//               label: "Mot de passe",
//               prefixIcon: Icons.lock_outline,
//               obscureText: !isPasswordVisible,
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isPasswordVisible = !isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),

//             _buildTextField(
//               controller: confirmPasswordController,
//               label: "Confirmer le mot de passe",
//               prefixIcon: Icons.lock_outline,
//               obscureText: !isConfirmPasswordVisible,
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   isConfirmPasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isConfirmPasswordVisible = !isConfirmPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Section type d'utilisateur
//             _buildSectionTitle("Type d'utilisateur"),
//             const SizedBox(height: 8),

//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               child: Column(
//                 children: [
//                   RadioListTile<String>(
//                     title: Row(
//                       children: [
//                         Icon(Icons.person, color: primaryColor),
//                         const SizedBox(width: 12),
//                         const Text(
//                           "Passager",
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                     value: "passager",
//                     groupValue: userType,
//                     onChanged: (value) {
//                       setState(() {
//                         userType = value!;
//                       });
//                     },
//                     activeColor: primaryColor,
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 4,
//                     ),
//                   ),
//                   Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
//                   RadioListTile<String>(
//                     title: Row(
//                       children: [
//                         Icon(Icons.drive_eta, color: primaryColor),
//                         const SizedBox(width: 12),
//                         const Text(
//                           "Chauffeur",
//                           style: TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                     value: "chauffeur",
//                     groupValue: userType,
//                     onChanged: (value) {
//                       setState(() {
//                         userType = value!;
//                       });
//                     },
//                     activeColor: primaryColor,
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 4,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // Informations du véhicule si chauffeur
//             if (isChauffeur) ...[
//               const SizedBox(height: 24),
//               _buildSectionTitle("Informations du véhicule"),
//               const SizedBox(height: 16),

//               _buildTextField(
//                 controller: marqueController,
//                 label: "Marque et modèle du véhicule",
//                 prefixIcon: Icons.directions_car,
//               ),
//               const SizedBox(height: 16),

//               _buildTextField(
//                 controller: plaqueController,
//                 label: "Plaque d'immatriculation",
//                 prefixIcon: Icons.confirmation_number_outlined,
//                 textCapitalization: TextCapitalization.characters,
//               ),
//               const SizedBox(height: 16),

//               _buildTextField(
//                 controller: placeController,
//                 label: "Nombre de places",
//                 prefixIcon: Icons.event_seat,
//                 keyboardType: TextInputType.number,
//               ),
//             ],

//             const SizedBox(height: 24),

//             // Case à cocher pour les conditions d'utilisation
//             Row(
//               children: [
//                 Checkbox(
//                   value: acceptTerms,
//                   onChanged: (value) {
//                     setState(() {
//                       acceptTerms = value ?? false;
//                     });
//                   },
//                   activeColor: primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                 ),
//                 Expanded(
//                   child: Text.rich(
//                     TextSpan(
//                       text: "J'accepte les ",
//                       children: [
//                         TextSpan(
//                           text: "conditions d'utilisation",
//                           style: TextStyle(
//                             color: primaryColor,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                         const TextSpan(text: " et la "),
//                         TextSpan(
//                           text: "politique de confidentialité",
//                           style: TextStyle(
//                             color: primaryColor,
//                             fontWeight: FontWeight.bold,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ],
//                     ),
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 30),

//             // Bouton d'inscription
//             ElevatedButton(
//               onPressed: () {
//                 // A COMPLETER: LOGIQUE D'INSCRIPTION
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: primaryColor,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 2,
//               ),
//               child: const Text(
//                 "CRÉER MON COMPTE",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.2,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Lien vers la page de connexion
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Déjà un compte ?",
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushReplacementNamed(context, '/login');
//                   },
//                   child: Text(
//                     "Se connecter",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: primaryColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // Méthode pour créer des titres de section
//   Widget _buildSectionTitle(String title) {
//     return Row(
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(width: 10),
//         Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
//       ],
//     );
//   }

//   // Méthode pour créer des champs de texte uniformes
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData prefixIcon,
//     TextInputType? keyboardType,
//     bool obscureText = false,
//     Widget? suffixIcon,
//     TextCapitalization textCapitalization = TextCapitalization.none,
//   }) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       textCapitalization: textCapitalization,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(prefixIcon),
//         suffixIcon: suffixIcon,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(
//             color: Theme.of(context).primaryColor,
//             width: 2,
//           ),
//         ),
//         contentPadding: const EdgeInsets.symmetric(
//           vertical: 16,
//           horizontal: 16,
//         ),
//       ),
//     );
//   }
// }

// // class RegisterPage extends StatefulWidget {
// //   const RegisterPage({super.key});

// //   @override
// //   State<RegisterPage> createState() => _RegisterPageState();
// // }

// // class _RegisterPageState extends State<RegisterPage> {
// //   final TextEditingController nomController = TextEditingController();
// //   final TextEditingController prenomController = TextEditingController();
// //   final TextEditingController telController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();

// //   // Chauffeur uniquement:
// //   final TextEditingController marqueController = TextEditingController();
// //   final TextEditingController plaqueController = TextEditingController();
// //   final TextEditingController placeController = TextEditingController();

// //   String userType = 'passager';

// //   @override
// //   Widget build(BuildContext context) {
// //     final isChauffeur = userType == 'chauffeur';

// //     return Scaffold(
// //       appBar: AppBar(title: Text("Créer un compte")),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             CustomTextfield(label: "Nom", controller: nomController),
// //             CustomTextfield(label: "Prénom", controller: prenomController),
// //             CustomTextfield(
// //               label: "Téléphone",
// //               controller: telController,
// //               keyboardType: TextInputType.phone,
// //             ),
// //             CustomTextfield(
// //               label: "Email",
// //               controller: emailController,
// //               keyboardType: TextInputType.emailAddress,
// //             ),
// //             CustomTextfield(
// //               label: "Mot de passe",
// //               controller: passwordController,
// //               obscureText: true,
// //             ),

// //             const Text("Type d'utilisateur"),
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: RadioListTile(
// //                     title: const Text("Passager"),
// //                     value: "passager",
// //                     groupValue: userType,
// //                     onChanged: (value) {
// //                       setState(() {
// //                         userType = value!;
// //                       });
// //                     },
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: RadioListTile(
// //                     title: const Text("Chauffeur"),
// //                     value: "chauffeur",
// //                     groupValue: userType,
// //                     onChanged: (value) {
// //                       setState(() {
// //                         userType = value!;
// //                       });
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             if (isChauffeur) ...[
// //               CustomTextfield(
// //                 label: "Marque véhicule",
// //                 controller: marqueController,
// //               ),
// //               CustomTextfield(
// //                 label: "Plaque d’immatriculation",
// //                 controller: plaqueController,
// //               ),
// //               CustomTextfield(
// //                 label: "Nombre de places",
// //                 controller: placeController,
// //                 keyboardType: TextInputType.number,
// //               ),
// //             ],
// //             const SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // A COMPLETER: LOGIQUE D'INSCRIPTION
// //               },
// //               child: const Text("Créer un compte"),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.pushNamed(context, '/login');
// //               },
// //               child: const Text("Déjà un compte ? Se connecter"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
