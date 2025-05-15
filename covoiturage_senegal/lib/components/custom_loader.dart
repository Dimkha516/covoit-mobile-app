import 'package:covoiturage_senegal/custom_loader_dialog.dart';
import 'package:flutter/material.dart';

class CustomLoader {
  static void show(
    BuildContext context, {
    String message = 'Chargement...',
    Color backgroundColor = Colors.white,
    Color loaderColor = Colors.blue,
    TextStyle? textStyle,
    double borderRadius = 12.0,
  }) {
    showDialog(
      barrierDismissible: false, // Empêche de fermer en dehors du loader
      context: context,
      builder:
          (_) => CustomLoaderDialog(
            message: message,
            backgroundColor: backgroundColor,
            loaderColor: loaderColor,
            textStyle: textStyle,
            borderRadius: borderRadius,
          ),
      // builder: (BuildContext context) {
      //   return WillPopScope(
      //     onWillPop: () async => false, // Bloque retour Android
      //     child: AlertDialog(
      //       backgroundColor: Colors.white,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(12),
      //       ),
      //       content: Row(
      //         children: [
      //           const CircularProgressIndicator(),
      //           const SizedBox(width: 16),
      //           Expanded(child: Text(message)),
      //         ],
      //       ),
      //     ),
      //   );
      // },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
