import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Niveles del LSM'),
      ),
      body: const Center(
        child: Text('Niveles del lenguaje de señas Mexicano'),
      ),
    );
  }
}