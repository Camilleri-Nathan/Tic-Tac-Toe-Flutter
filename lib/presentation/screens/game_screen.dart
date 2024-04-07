import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/game_board.dart';
import 'package:tic_tac_toe_flutter/domain/entities/board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final Board _board = Board(); // Initializes the game board.
  String _currentPlayer = 'X'; // Tracks the current player, starting with 'X'.
  String? _winner;
  bool _isDraw = false;

  void _handleTileTap(int index) {
    if (_winner != null || _isDraw || _board.tiles[index] != null) {
      // Does nothing if the game is over or the tile is already occupied
      return;
    }

    if (_board.tiles[index] == null) {
      setState(() {
        _board.makeMove(index, _currentPlayer); // Attempts to place the current player's mark on the board.
        var winner = _board.checkWinner();
        if (winner != null) {
          _winner = winner;
        } else if (_board.isFull) {
          _isDraw = true;
        } else {
          _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X'; // Switches the current player.
        }
      });
    }
  }

  void _resetBoard() {
    setState(() {
      _board.tiles = List.filled(9, null);
      _currentPlayer = 'X';
      _winner = null;
      _isDraw = false;
    });
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
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[50]!, Colors.blue[200]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Tour du joueur : $_currentPlayer",
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
            ),
            AspectRatio(
              aspectRatio: 1,
              child: GameBoard(
                boardState: _board.tiles,
                onTileTapped: _handleTileTap, // Passes the tile tap handler to the GameBoard.
              ),
            ),
            if (_winner != null || _isDraw) ...[
              const SizedBox(height: 20),
              Text(
                _isDraw ? "Match nul !" : 'Joueur $_winner a gagné !',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ).animate().scale(duration: 500.ms, curve: Curves.elasticOut).fadeIn(duration: 500.ms),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _resetBoard,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text("Rejouer"),
              ),
              const SizedBox(height: 20),
            ],
          ],
        ),
      ),
    );
  }
}
