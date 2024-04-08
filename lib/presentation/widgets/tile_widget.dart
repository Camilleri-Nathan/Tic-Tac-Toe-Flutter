import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String value;
  final VoidCallback onTap;
  final bool isWinningTile;

  const TileWidget({
    super.key,
    required this.value,
    required this.onTap,
    this.isWinningTile = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isWinningTile ? Colors.green : Colors.grey[300],
          border: Border.all(color: Colors.black54),
        ),
        child: Text(
          value,
          style: const TextStyle(fontSize: 32, color: Colors.black),
        ),
      ),
    );
  }
}
