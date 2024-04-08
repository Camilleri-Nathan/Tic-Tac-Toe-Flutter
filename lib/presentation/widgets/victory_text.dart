import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// A stylized text widget for displaying victory messages.
class VictoryText extends StatelessWidget {
  final String text;

  // Accepts a string to display.
  const VictoryText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // Renders the text with specific styling and animation.
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.yellow, // Change color to yellow for victory text
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(5.0, 5.0),
          ),
        ],
      ),
    )
        .animate()
        .scale(
          // Add scale animation
          duration: 500.ms,
          curve: Curves.elasticOut,
        )
        .fadeIn(
          // Add fade-in animation
          duration: 500.ms,
        );
  }
}
