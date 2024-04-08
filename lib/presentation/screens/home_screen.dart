import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/presentation/screens/game_screen.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/custom_play_button.dart';
import 'package:tic_tac_toe_flutter/presentation/widgets/welcome_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Manages the animation lifecycle.
  late Animation<Color?> _colorAnimation; // Defines the color animation for the background.

  @override
  void initState() {
    super.initState();
    // Initializes the animation controller and repeats the animation in reverse for a dynamic background effect.
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // Sets up a color tween animation from blue to purple.
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.purple,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Properly disposes the animation controller to avoid memory leaks.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _colorAnimation, // Uses the color animation for the background.
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              // Applies a linear gradient that changes dynamically according to the animation.
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade200, _colorAnimation.value ?? Colors.purple],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const WelcomeText(text: 'Bienvenue au Tic Tac Toe'),
                  const SizedBox(height: 20),
                  CustomPlayButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GameScreen()),
                    ),
                    label: 'Jouer', // Navigates to the GameScreen when pressed.
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
