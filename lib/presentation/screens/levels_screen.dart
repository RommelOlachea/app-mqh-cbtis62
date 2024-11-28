import 'package:flutter/material.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Niveles del LSM'),
      ),
      body: const Center(
        child: Text('Niveles del Lenguaje de Señas Mexicano'),
      ),
    );
  }
}