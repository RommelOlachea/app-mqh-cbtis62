import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final Map<String, String> mediaList = {
    'assets/topics/numbers/1.jpg': 'UNO Se estira el índice con la palma al frente.',
    'assets/topics/numbers/2.jpg': 'DOS Se estiran los dedos índice y medio.',
    'assets/topics/numbers/3.jpg': 'TRES Se estiran los dedos índice, medio y anular con la palma al frente.',
    'assets/topics/numbers/4.jpg': 'CUATRO Se estiran los dedos índice, medio, anular y meñique.',
    'assets/topics/numbers/5.jpg': 'CINCO Se abre la mano con la palma al frente y los dedos separados.',
    'assets/topics/numbers/6.jpg': 'SEIS Se hace la letra a con el pulgar hacia arriba.',
    'assets/topics/numbers/7.jpg': 'SIETE Se hace una letra g, colocada en forma inclinada.',
    'assets/topics/numbers/8.jpg': 'OCHO Se estiran los dedos pulgar, índice y medio, separados con la palma hacia usted.',
    'assets/topics/numbers/9.gif': 'NUEVE Se hace la letra b con la palma hacia usted. Luego se cierran los dedos rodeando el pulgar.',
    'assets/topics/numbers/10.gif': 'DIEZ Se hace el número 5 con la palma hacia arriba, y se rota la mano rápidamente hacia abajo.',
    'assets/topics/numbers/11.gif': 'ONCE Se hace la letra a con la palma hacia usted y el dedo pulgar señalando hacia arriba, y se rota la mano arriba y a un lado.',
    'assets/topics/numbers/12.gif': 'DOCE Se hace el número 7, y se mueve la mano arriba y a un lado.',
    'assets/topics/numbers/13.gif': 'TRECE Se hace el número 8, y se rota la mano arriba y a un lado.',
    'assets/topics/numbers/14.gif': 'CATORCE Se estiran los dedos índice, medio, anular y meñique, y se mueve la mano arriba y a un lado.',
    'assets/topics/numbers/15.gif': 'QUINCE Se hace el número 5 y se rota la mano arriba y a un lado.',
    'assets/topics/numbers/16.gif': 'DIECISEIS Se hace el número 6 con la palma hacia abajo, y se mueve hacia adelante.',
    'assets/topics/numbers/17.gif': 'DIECISIETE Se hace el número 7 con la palma hacia abajo, y se mueve hacia adelante.',
    'assets/topics/numbers/18.gif': 'DIECIOCHO Se hace el número 8 con la punta de los dedos señalando al frente, y se mueve hacia adelante',
    'assets/topics/numbers/19.gif': 'DIECINUEVE Se hace el número 4 con la punta de los dedos señalando al frente, y se mueve hacia adelante.',
    'assets/topics/numbers/20.gif': 'VEINTE Con el puño cerrado y los dedos pulgar e Indice estirados, forma una "C" y los pellizcas repetidamente',
    'assets/topics/numbers/100.gif': 'Cien Se estira el índice, y se mueve a un lado hasta transformarse en c.',
  };

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
    final currentMedia = mediaList.keys.elementAt(currentIndex);
    final currentLetter = _getLetterFromMedia(currentMedia);

    final  description =  mediaList[currentMedia];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Números LSM',
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
              const SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  description ?? 'Sin descripción',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
