import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe_flutter/domain/entities/board.dart';

void main() {
  group('Board Class Tests', () {
    // Test to verify that makeMove correctly places a player's mark and returns true for a valid move.
    test('makeMove should place player mark and return true for a valid move', () {
      final board = Board();
      bool result = board.makeMove(0, 'X'); // Attempt to place an 'X' at index 0.

      // Verify that the method returns true and the mark is correctly placed.
      expect(result, isTrue);
      expect(board.tiles[0], 'X');
    });

    // Test to verify that makeMove returns false for an invalid move.
    test('makeMove should return false for an invalid move', () {
      final board = Board();
      board.tiles[0] = 'X'; // The tile at index 0 is already occupied.
      bool result = board.makeMove(0, 'O'); // Attempt to place an 'O' at index 0.

      // Verify that the method returns false without changing the state of the board.
      expect(result, isFalse);
      expect(board.tiles[0], 'X'); // The tile should still contain 'X'.
    });

    // Test to verify that checkWinner correctly identifies a winner.
    test('checkWinner should correctly identify a winner', () {
      final board = Board();
      // Set up a winning scenario for 'X'.
      board.tiles[0] = 'X';
      board.tiles[1] = 'X';
      board.tiles[2] = 'X';

      // Verify that checkWinner identifies 'X' as the winner.
      expect(board.checkWinner(), 'X');
    });

    // Test to verify that checkWinner returns null when there is no winner yet.
    test('checkWinner should return null when there is no winner', () {
      final board = Board();
      // Set up a board without a winner.
      board.tiles[0] = 'X';
      board.tiles[1] = 'O';
      board.tiles[2] = 'X';

      // Verify that checkWinner returns null.
      expect(board.checkWinner(), isNull);
    });

    // Test to verify that isFull returns true when the board is completely filled.
    test('isFull should return true when the board is full', () {
      final board = Board();
      // Fill the board without leaving any empty tiles.
      for (int i = 0; i < 9; i++) {
        board.tiles[i] = i.isEven ? 'X' : 'O';
      }

      // Verify that isFull returns true.
      expect(board.isFull, isTrue);
    });
  });
}
