import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  static const name = 'animated_screen';

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();

    setState(() {
      width = random.nextInt(300).toDouble() + 50;
      height = random.nextInt(300).toDouble() + 50;
      color = Color.fromRGBO(
        random.nextInt(256), // 0-255 RED
        random.nextInt(256), // 0-255 GREEN
        random.nextInt(256), // 0-255 BLUE
        1, // 0.0-1.0 OPACITY
      );
      borderRadius = random.nextInt(100).toDouble() + 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCubic,
          height: height <= 0 ? 0 : height,
          width: width <= 0 ? 0 : width,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
