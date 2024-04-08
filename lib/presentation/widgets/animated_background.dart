import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  AnimatedBackgroundState createState() => AnimatedBackgroundState();
}

class AnimatedBackgroundState extends State<AnimatedBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Controls the animation.
  late Animation<Color?> _colorAnimation; // Defines the color transition animation.

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // Define the color transition from blue to purple.
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.purple,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when the widget is removed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use AnimatedBuilder to rebuild the widget tree when _colorAnimation changes.
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        // Applies a linear gradient based on the current color animation value.
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                _colorAnimation.value ?? Colors.blue, // Fallback to blue if null.
                _colorAnimation.value?.withOpacity(0.5) ?? Colors.purple, // Make the end color slightly transparent.
              ],
            ),
          ),
          child: widget.child, // Displays the child widget on top of the background.
        );
      },
    );
  }
}
