class Board {
  // Initializes the game board with 9 null entries, representing empty tiles.
  List<String?> tiles = List.filled(9, null);

  // Attempts to make a move on the board for a given player ('X' or 'O').
  // Returns true if the move is successful, false otherwise.
  bool makeMove(int index, String player) {
    // Checks if the move is within bounds and the tile is empty.
    if (index < 0 || index >= 9 || tiles[index] != null) {
      return false;
    }
    tiles[index] = player; // Places the player's mark on the board.
    return true;
  }

  Map<String, dynamic> checkWinner() {
    const winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    for (var pattern in winPatterns) {
      if (pattern.every((index) => tiles[index] != null && tiles[index] == tiles[pattern[0]])) {
        return {"winner": tiles[pattern[0]], "winningTiles": pattern};
      }
    }
    return {"winner": null, "winningTiles": []};
  }

  bool get isFull => !tiles.contains(null);
}
