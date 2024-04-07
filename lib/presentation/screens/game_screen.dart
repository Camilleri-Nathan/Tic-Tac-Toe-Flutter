import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/game_board.dart';
import 'package:tic_tac_toe_flutter/domain/entities/board.dart';

// The main game screen that displays the Tic-Tac-Toe board and controls game logic.
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final Board _board = Board(); // Initializes the game board.
  String _currentPlayer = 'X'; // Tracks the current player, starting with 'X'.

  // Handles logic for when a tile on the game board is tapped.
  void _handleTileTap(int index) {
    // Only allows a move if the tapped tile is empty.
    if (_board.tiles[index] == null) {
      setState(() {
        _board.makeMove(index, _currentPlayer); // Attempts to place the current player's mark on the board.
        if (_board.checkWinner() != null) {
          // Checks for a winner after the move.
          final winner = _currentPlayer;
          _showEndDialog('Player $winner won!'); // Shows a dialog if there's a winner.
          _resetBoard(); // Resets the board for a new game.
        } else if (_board.isFull) {
          // Checks if the board is full without a winner (draw).
          _showEndDialog('It\'s a draw!');
          _resetBoard(); // Resets the board for a new game.
        } else {
          _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X'; // Switches the current player.
        }
      });
    }
  }

  // Resets the board to its initial state and sets the current player to 'X'.
  void _resetBoard() {
    setState(() {
      _board.tiles = List.filled(9, null);
      _currentPlayer = 'X';
    });
  }

  // Displays a dialog showing the game outcome (win or draw) and allows the game to be restarted.
  void _showEndDialog(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog.
                _resetBoard(); // Resets the game for another round.
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'), // Sets the title of the AppBar.
        backgroundColor: Colors.deepPurple, // Sets a custom color for the AppBar.
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Applies a linear gradient to the background.
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue[50]!,
              Colors.blue[200]!,
            ],
          ),
        ),
        child: Center(
          child: AspectRatio(
            aspectRatio: 1, // Maintains the board as a square.
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: GameBoard(
                boardState: _board.tiles,
                onTileTapped: _handleTileTap, // Passes the tile tap handler to the GameBoard.
              ),
            ),
          ),
        ),
      ),
    );
  }
}
