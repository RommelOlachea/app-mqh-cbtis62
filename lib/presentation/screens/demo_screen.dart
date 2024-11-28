import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MQH TEMARIO'),
      ),
      body: const Center(
        child: Text('Temas a elegir'),
      ),
    );
  }
}