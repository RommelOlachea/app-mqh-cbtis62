import 'package:flutter/material.dart';

class DemoScreen2 extends StatelessWidget {
  const DemoScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progreso del LSM'),
      ),
      body: const Center(
        child: Text('Progreso del Lenguaje de Señas Mexicano'),
      ),
    );
  }
}