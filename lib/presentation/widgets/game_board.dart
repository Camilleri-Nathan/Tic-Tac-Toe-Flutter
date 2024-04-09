import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final List<String?> boardState; // The current state of each tile ('X', 'O', or null for empty).
  final Function(int index) onTileTapped; // Callback for tile tap events.
  final List<int> winningTiles; // Add this line to accept winning tiles.

  const GameBoard({
    super.key,
    required this.boardState,
    required this.onTileTapped,
    this.winningTiles = const [], // Initialize with an empty list if not provided.
  });

  TextStyle getSymbolStyle(String? symbol) {
    return TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: symbol == 'X' ? Colors.redAccent : Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    // GridView.builder creates a 3x3 grid.
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 9,
      itemBuilder: (context, index) => _buildGameTile(context, index),
      physics: const NeverScrollableScrollPhysics(), // Prevent grid scrolling.
    );
  }

  Widget _buildGameTile(BuildContext context, int index) {
    bool isWinningTile = winningTiles.contains(index); // Check if this tile is a winning tile.

    // InkWell wraps each tile for tap detection.
    return InkWell(
      onTap: () => onTileTapped(index),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isWinningTile ? Colors.yellow : Colors.blue[100], // Highlight winning tiles in yellow.
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        // Display the player's mark if present.
        child: Center(
          child: Text(
            boardState[index] ?? '',
            style: getSymbolStyle(boardState[index]),
          ),
        ),
      ),
    );
  }
}
