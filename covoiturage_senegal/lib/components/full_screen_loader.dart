import 'package:flutter/material.dart';

class FullScreenLoader {
  static OverlayEntry? _loaderEntry;

  static void show(
    BuildContext context, {
    String message = "Chargement...",
    Color backgroundColor = Colors.black54,
    Color loaderColor = Colors.white,
    TextStyle? textStyle,
  }) {
    if (_loaderEntry != null) return;

    _loaderEntry = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              Container(
                color: backgroundColor,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: loaderColor),
                    const SizedBox(height: 20),
                    Text(
                      message,
                      style:
                          textStyle ??
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
    Overlay.of(context, rootOverlay: true).insert(_loaderEntry!);
  }

  static void hide() {
    _loaderEntry?.remove();
    _loaderEntry = null;
  }
}
