import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  // Constructor que recibe el título como un parámetro nombrado
  const HomeScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // Usa el título recibido como parámetro
      ),
      body: const Center(
        child: Text(
          '¡Bienvenido!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
