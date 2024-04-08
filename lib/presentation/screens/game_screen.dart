import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/animated_background.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/player_turn_widget.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/game_result_widget.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/game_board.dart';
import 'package:tic_tac_toe_flutter/domain/entities/board.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> {
  final Board _board = Board();
  String _currentPlayer = 'X';
  String? _winner;
  bool _isDraw = false;

  void _handleTileTap(int index) {
    if (_winner != null || _isDraw || _board.tiles[index] != null) {
      return;
    }

    setState(() {
      _board.makeMove(index, _currentPlayer);
      var winner = _board.checkWinner();
      if (winner != null) {
        _winner = winner;
      } else if (_board.isFull) {
        _isDraw = true;
      } else {
        _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
      }
    });
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
      body: AnimatedBackground(
        child: SafeArea(
          child: LayoutBuilder(
            // Use LayoutBuilder for more layout control
            builder: (context, constraints) {
              // Dynamically calculate spacings based on available height
              double totalHeight = constraints.maxHeight;
              double topPadding = totalHeight * 0.05; // 5% of the total space at the top
              double betweenElements = totalHeight * 0.02; // 2% space between elements

              return SingleChildScrollView(
                // Ensure everything is accessible on small screens
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    // To ensure the content takes up at least the available height
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Evenly spaced
                      children: [
                        SizedBox(height: topPadding), // Space above the player turn widget
                        PlayerTurnWidget(currentPlayer: _currentPlayer),
                        SizedBox(height: betweenElements), // Space between player turn widget and game board
                        Expanded(
                          child: Center(
                            child: AspectRatio(
                              aspectRatio: 1, // Keep the game board square
                              child: GameBoard(
                                boardState: _board.tiles,
                                onTileTapped: _handleTileTap,
                              ),
                            ),
                          ),
                        ),
                        if (_winner != null || _isDraw) SizedBox(height: betweenElements), // Space before the result
                        if (_winner != null || _isDraw) // Display the game results below the board
                          GameResultWidget(
                            resultMessage: _isDraw ? "It's a draw!" : 'Player $_winner won!',
                            onReset: _resetBoard,
                          ),
                        SizedBox(height: topPadding), // Symmetrical space at the bottom
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
