import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/videos/bienvenida.mp4')
    //   ..initialize().then((_) {
    //     setState(() {
    //       _controller.play();
    //       _controller.setLooping(false);
    //       _controller.setVolume(0.0);
          
    //     });
    //   });
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  // Asegurar que el Future se ejecute después de build
  Future.microtask(() {
    Timer(const Duration(milliseconds: 4000), () async {
      context.replace('/home');
    });
  });

  return Scaffold(
    body: Stack(
      children: [
        // Video en el fondo
        // if (_controller.value.isInitialized) ...[
        //   Positioned.fill(
        //     child: FittedBox(
        //       fit: BoxFit.cover, // Ajusta el video sin distorsionarlo
        //       child: SizedBox(
        //         width: _controller.value.size.width,
        //         height: _controller.value.size.height,
        //         child: VideoPlayer(_controller),
        //       ),
        //     ),
        //   ),
        // ] else
        //   const Center(child: CircularProgressIndicator()),

        // Gradiente oscuro
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
        ),
        // Texto centrado horizontalmente y hacia la parte inferior
        const Positioned(
          bottom: 100, // Espaciado desde la parte inferior
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Hola Bienvenido!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}
