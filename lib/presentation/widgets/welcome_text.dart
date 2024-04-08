import 'package:flutter/material.dart';

// A stylized text widget for displaying welcome messages.
class WelcomeText extends StatelessWidget {
  final String text;

  // Accepts a string to display.
  const WelcomeText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // Renders the text with specific styling.
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(5.0, 5.0),
          ),
        ],
      ),
    );
  }
}
