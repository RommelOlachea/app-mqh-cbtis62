import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final List<String> mediaList = [
    'assets/topics/numbers/1.jpg',
    'assets/topics/numbers/2.jpg',
    'assets/topics/numbers/3.jpg',
    'assets/topics/numbers/4.jpg',
    'assets/topics/numbers/5.jpg',
    'assets/topics/numbers/6.jpg',
    'assets/topics/numbers/7.jpg',
    'assets/topics/numbers/8.jpg',
    'assets/topics/numbers/9.gif',
    'assets/topics/numbers/10.gif',
    'assets/topics/numbers/11.gif',
    'assets/topics/numbers/12.gif',
    'assets/topics/numbers/13.gif',
    'assets/topics/numbers/14.gif',
    'assets/topics/numbers/15.gif',
    'assets/topics/numbers/16.gif',
    'assets/topics/numbers/17.gif',
    'assets/topics/numbers/18.gif',
    'assets/topics/numbers/19.gif',
    'assets/topics/numbers/20.gif',
    'assets/topics/numbers/100.gif',
  ];

  int currentIndex = 0;

  void _nextMedia() {
    if (currentIndex < mediaList.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _prevMedia() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  String _getLetterFromMedia(String media) {
    return media.split('/').last.split('.').first.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final currentMedia = mediaList[currentIndex];
    final currentLetter = _getLetterFromMedia(currentMedia);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Abecedario LSM',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/profile/icono_perfil4.png'),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            _nextMedia();
          } else if (details.primaryVelocity! > 0) {
            _prevMedia();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[900]!, Colors.blueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding:const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 130),
              CircleAvatar(
                radius: 44,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    currentLetter,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  currentMedia,
                  key: ValueKey(currentMedia),
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: _prevMedia,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: _nextMedia,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
