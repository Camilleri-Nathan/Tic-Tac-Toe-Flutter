class Board {
  // Initializes the game board with 9 null entries, representing empty tiles.
  List<String?> tiles = List.filled(9, null);

  // Attempts to make a move on the board for a given player ('X' or 'O').
  // Returns true if the move is successful, false otherwise.
  bool makeMove(int index, String player) {
    // Checks if the move is within bounds and the tile is empty.
    if (index < 0 || index >= 9 || tiles[index] != null) {
      return false; // Invalid move.
    }
    tiles[index] = player; // Places the player's mark on the board.
    return true;
  }

  // Checks if there's a winner by comparing current board state to winning patterns.
  // Returns 'X', 'O' if a winner is found, or null if no winner yet.
  String? checkWinner() {
    const winPatterns = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    // Loops through all winning patterns to see if any apply to the current board.
    for (var pattern in winPatterns) {
      if (pattern.every((index) => tiles[index] != null && tiles[index] == tiles[pattern[0]])) {
        return tiles[pattern[0]]; // Returns the winner ('X' or 'O').
      }
    }
    return null; // No winner found.
  }

  bool get isFull => !tiles.contains(null);
}
