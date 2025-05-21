import 'package:flutter/material.dart';

class DriverTripDetailsPage extends StatelessWidget {
  final Map<String, dynamic> trajet;

  const DriverTripDetailsPage({super.key, required this.trajet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du trajet'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informations du trajet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    InfoRow(label: 'Départ', value: trajet['depart']),
                    InfoRow(label: 'Arrivée', value: trajet['arrivee']),
                    InfoRow(label: 'Date', value: trajet['date']),
                    InfoRow(label: 'Heure', value: trajet['heure']),
                    InfoRow(
                      label: 'Places restantes',
                      value: trajet['places'].toString(),
                    ),
                    InfoRow(
                      label: 'Prix / place',
                      value: '${trajet['prix']} FCFA',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (trajet["vehicule"] != null)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
            const SizedBox(height: 20),
            const Text(
              'Passagers inscrits',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Divider(thickness: 1.5),
            ...trajet['passagers'].map<Widget>(
              (passager) => Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.teal),
                  title: Text(passager),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(color: Colors.black87)),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class DriverTripDetailsPage extends StatefulWidget {
//   final Map<String, dynamic> trajet;

//   const DriverTripDetailsPage({super.key, required this.trajet});

//   @override
//   State<DriverTripDetailsPage> createState() => _DriverTripDetailsPageState();
// }

// class _DriverTripDetailsPageState extends State<DriverTripDetailsPage> {
//   late List<Map<String, dynamic>> passagers;

//   @override
//   void initState() {
//     super.initState();
//     // On suppose que chaque passager est un Map avec au moins 'nom' et 'telephone'
//     passagers = List<Map<String, dynamic>>.from(widget.trajet['passagers']);
//   }

//   void removePassager(Map<String, dynamic> passager) {
//     setState(() {
//       passagers.remove(passager);
//     });

//     // Tu peux ici appeler une API pour retirer réellement le passager du backend.
//   }

//   void appeler(String telephone) async {
//     final Uri url = Uri.parse('tel:$telephone');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Impossible de lancer l\'appel')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final trajet = widget.trajet;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Détails du trajet'),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Informations du trajet',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     InfoRow(label: 'Départ', value: trajet['depart']),
//                     InfoRow(label: 'Arrivée', value: trajet['arrivee']),
//                     InfoRow(label: 'Date', value: trajet['date']),
//                     InfoRow(label: 'Heure', value: trajet['heure']),
//                     InfoRow(
//                       label: 'Places restantes',
//                       value: trajet['places'].toString(),
//                     ),
//                     InfoRow(
//                       label: 'Prix / place',
//                       value: '${trajet['prix']} FCFA',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (trajet["vehicule"] != null)
//               Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 4,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Véhicule',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       InfoRow(
//                         label: 'Marque',
//                         value: trajet['vehicule']['marque'],
//                       ),
//                       InfoRow(
//                         label: 'Plaque',
//                         value: trajet['vehicule']['plaque'],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             const SizedBox(height: 20),
//             const Text(
//               'Passagers inscrits',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             const Divider(thickness: 1.5),
//             if (passagers.isEmpty) const Text('Aucun passager inscrit.'),
//             ...passagers.map(
//               (passager) => Card(
//                 margin: const EdgeInsets.symmetric(vertical: 6),
//                 child: ListTile(
//                   leading: const Icon(Icons.person, color: Colors.teal),
//                   title: Text(passager['nom']),
//                   subtitle: Text(passager['telephone']),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.call, color: Colors.green),
//                         onPressed: () => appeler(passager['telephone']),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder:
//                                 (_) => AlertDialog(
//                                   title: const Text("Retirer le passager"),
//                                   content: Text(
//                                     "Retirer ${passager['nom']} de ce trajet ?",
//                                   ),
//                                   actions: [
//                                     TextButton(
//                                       onPressed: () => Navigator.pop(context),
//                                       child: const Text("Annuler"),
//                                     ),
//                                     TextButton(
//                                       onPressed: () {
//                                         Navigator.pop(context);
//                                         removePassager(passager);
//                                       },
//                                       child: const Text("Confirmer"),
//                                     ),
//                                   ],
//                                 ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class InfoRow extends StatelessWidget {
//   final String label;
//   final String value;

//   const InfoRow({super.key, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
//           Text(value, style: const TextStyle(color: Colors.black87)),
//         ],
//       ),
//     );
//   }
// }
