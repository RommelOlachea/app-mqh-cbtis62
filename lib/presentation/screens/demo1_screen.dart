import 'package:flutter/material.dart';

class DemoScreen1 extends StatelessWidget {
  const DemoScreen1({super.key});

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