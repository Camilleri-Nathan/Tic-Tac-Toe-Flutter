import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/presentation/screens/home_screen.dart'; // Assurez-vous que le chemin est correct

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Changé à HomeScreen ici
    );
  }
}
