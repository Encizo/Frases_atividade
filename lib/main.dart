import 'package:flutter/material.dart';
import 'package:atvidade_frases/motivacional_screen.dart';

void main() {
  runApp(const MotivationalApp());
}

class MotivationalApp extends StatelessWidget {
  const MotivationalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MotivationalScreen(),
    );
  }
}
