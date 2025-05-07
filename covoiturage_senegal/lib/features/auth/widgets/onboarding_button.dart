import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;

  const OnboardingButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.blue.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // child: Text(
        //   label,
        //   style: const TextStyle(fontSize: 18, color: Colors.white),
        // ),
      ),
    );
  }
}
