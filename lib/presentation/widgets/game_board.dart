import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GridTile(
          child: Container(
            margin: const EdgeInsets.all(4.0), // Ajoute un peu d'espace entre les cases
            decoration: BoxDecoration(
              color: Colors.blue[100], // Couleur de fond de chaque case
              border: Border.all(color: Colors.blue, width: 2.0), // Bordure des cases
              borderRadius: BorderRadius.circular(8), // Coins arrondis
              boxShadow: [
                // Ajoute une ombre pour un effet 3D léger
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Center(
                // TODO LOGIC X O
                ),
          ),
        );
      },
      physics: const NeverScrollableScrollPhysics(), // Ajoutez ceci pour empêcher le défilement
    );
  }
}
