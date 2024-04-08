import 'package:flutter/material.dart';

// A customizable play button widget.
class CustomPlayButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  // Constructor takes a function to execute on press and an optional label.
  const CustomPlayButton({
    super.key,
    required this.onPressed,
    this.label = "Jouer",
  });

  @override
  Widget build(BuildContext context) {
    // Button with an icon, label, and custom style.
    return ElevatedButton.icon(
      icon: const Icon(Icons.play_arrow, color: Colors.white),
      label: Text(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white.withOpacity(0.8),
        textStyle: const TextStyle(fontSize: 20),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 10,
      ),
    );
  }
}
