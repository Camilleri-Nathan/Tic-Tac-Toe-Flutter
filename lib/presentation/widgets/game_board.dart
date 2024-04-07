import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  final List<String?> boardState;
  final Function(int index) onTileTapped;

  const GameBoard({super.key, required this.boardState, required this.onTileTapped});

  TextStyle getSymbolStyle(String? symbol) {
    return TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      color: symbol == 'X' ? Colors.redAccent : Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 9,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => onTileTapped(index),
          child: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              border: Border.all(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 2, blurRadius: 5, offset: const Offset(0, 3))],
            ),
            child: Center(
              child: Text(
                boardState[index] ?? '',
                style: getSymbolStyle(boardState[index]),
              ),
            ),
          ),
        );
      },
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
