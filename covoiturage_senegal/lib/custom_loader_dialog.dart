import 'package:flutter/material.dart';

class CustomLoaderDialog extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color loaderColor;
  final TextStyle? textStyle;
  final double borderRadius;

  const CustomLoaderDialog({
    Key? key,
    this.message = 'Chargement...',
    this.backgroundColor = Colors.white,
    this.loaderColor = Colors.blue,
    this.textStyle,
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      content: Row(
        children: [
          CircularProgressIndicator(color: loaderColor),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
