import 'package:flutter/material.dart';
import 'victory_text.dart';
import 'custom_play_button.dart';

class GameResultWidget extends StatelessWidget {
  final String resultMessage;
  final VoidCallback onReset;

  const GameResultWidget({
    super.key,
    required this.resultMessage,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VictoryText(text: resultMessage),
        const SizedBox(height: 20),
        CustomPlayButton(
          onPressed: onReset,
          label: "Play Again",
        ),
      ],
    );
  }
}
