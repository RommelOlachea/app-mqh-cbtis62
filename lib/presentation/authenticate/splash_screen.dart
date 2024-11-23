import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    //con microtask se asegura que el Future se ejecute después de que se haya completado el build
    Future.microtask(() {
      Timer(const Duration(milliseconds: 3500), () async {
        Navigator.pushReplacementNamed(
          context, '/home');        
      });
    });

    return const Scaffold(
      body: Center(
        child: Text(
          'Este es el splash screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
