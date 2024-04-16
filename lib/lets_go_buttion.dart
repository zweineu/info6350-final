import 'package:flutter/material.dart';

class LetsGoButton extends StatelessWidget {
  final VoidCallback onTap;

  const LetsGoButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      width: double.infinity, // Match the width to parent
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue, // Text color
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        onPressed: onTap,
        child: const Text(
          "Let's Go",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}