import 'package:flutter/material.dart';

class PlayerTurnWidget extends StatelessWidget {
  final String currentPlayer;

  const PlayerTurnWidget({
    super.key,
    required this.currentPlayer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "Player's turn : $currentPlayer",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 3.0,
                color: Color.fromARGB(125, 0, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
