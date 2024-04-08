import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/presentation/screens/game_screen.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/animated_background.dart'; // Assurez-vous que le chemin d'importation est correct
import 'package:tic_tac_toe_flutter/presentation/widgets/custom_play_button.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/welcome_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Utilisation du widget AnimatedBackground pour l'arrière-plan animé
    return Scaffold(
      body: AnimatedBackground(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const WelcomeText(text: 'Bienvenue au Tic Tac Toe'), // Texte de bienvenue
              const SizedBox(height: 20), // Espace entre le texte et le bouton
              CustomPlayButton(
                onPressed: () {
                  // Navigation vers GameScreen lorsque le bouton est pressé
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen()));
                },
                label: 'Jouer', // Texte du bouton
              ),
            ],
          ),
        ),
      ),
    );
  }
}
