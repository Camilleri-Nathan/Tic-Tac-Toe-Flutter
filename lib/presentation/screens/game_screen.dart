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
  List<int> winningTiles = [];

  void _handleTileTap(int index) {
    if (_winner != null || _isDraw || _board.tiles[index] != null) {
      return;
    }

    setState(() {
      _board.makeMove(index, _currentPlayer);
      var result = _board.checkWinner();
      _winner = result['winner'];
      if (_winner != null) {
        winningTiles = List<int>.from(result['winningTiles']);
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
      winningTiles = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerTurnWidget(currentPlayer: _currentPlayer),
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: GameBoard(
                        boardState: _board.tiles,
                        onTileTapped: _handleTileTap,
                        winningTiles: winningTiles,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _winner != null || _isDraw,
                  child: GameResultWidget(
                    resultMessage: _isDraw ? "It's a draw!" : 'Player $_winner won!',
                    onReset: _resetBoard,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
