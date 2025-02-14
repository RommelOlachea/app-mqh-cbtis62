import 'package:flutter/material.dart';

class AlphabetScreen extends StatefulWidget {
  @override
  _AlphabetScreenState createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final Map<String, String> mediaList = {
    'assets/topics/alphabet/A.jpg' : 'A Con la mano cerrada, se muestran las uñas y se estira el dedo pulgar hacia un lado. La palma mira al frente',
    'assets/topics/alphabet/B.jpg' : 'B Los dedos índice, medio, anular y meñique se estiran bien unidos y el pulgar se dobla hacia la palma, la cual mira al frente.',
    'assets/topics/alphabet/C.jpg' : 'C Los dedos índice, medio, anular y meñique se mantienen bien unidos y en posición cóncava; el pulgar también se pone en esa posición. La palma mira a un lado.',
    'assets/topics/alphabet/D.jpg' : 'D Los dedos medio, anular, meñique y pulgar se unen por las puntas y el dedo índice se estira. La palma mira al frente.',
    'assets/topics/alphabet/E.jpg' : 'E Se doblan los dedos completamente, y se muestran las uñas. La palma mira al frente',
    'assets/topics/alphabet/F.jpg' : 'F Con la mano abierta y los dedos bien unidos, se dobla el índice hasta que su parte lateral toque la yema del pulgar. La palma mira a un lado',
    'assets/topics/alphabet/G.jpg' : 'G Se cierra la mano y los dedos índice y pulgar se estiran. La palma mira hacia usted.',
    'assets/topics/alphabet/H.jpg' : 'H Con la mano cerrada y los dedos índice y medio bien estirados y unidos, se extiende el dedo pulgar señalando hacia arriba. La palma mira hacia usted.',
    'assets/topics/alphabet/I.jpg' : 'I Con la mano cerrada, el dedo meñique se estira señalando hacia arriba. La palma se pone de lado.',
    'assets/topics/alphabet/J.gif' : 'J Con la mano cerrada, el dedo meñique bien estirado señalando hacia arriba y la palma a un lado dibuja una j en el aire.',
    // 'assets/topics/alphabet/K.jpg' : 'K Se cierra la mano con los dedos índice, medio y pulgar estirados. La yema del pulgar se pone entre el índice y el medio. Se mueve la muñeca hacia arriba.', //todo: hace falta generar este recurso con kaleb y litzi
    'assets/topics/alphabet/L.jpg' : 'L Con la mano cerrada y los dedos índice y pulgar estirados, se forma una l. La palma mira al frente.',
    'assets/topics/alphabet/LL.gif' : '',
    'assets/topics/alphabet/M.jpg' : 'M Con la mano cerrada, se ponen los dedos índice, medio y anular sobre el pulgar.',
    'assets/topics/alphabet/N.jpg' : 'N Con la mano cerrada, se ponen los dedos índice y medio sobre el pulgar.',
    'assets/topics/alphabet/NN.gif' : '',
    'assets/topics/alphabet/O.jpg' : 'O Con la mano se forma una letra o. Todos los dedos se tocan por las puntas.',
    'assets/topics/alphabet/P.jpg' : 'P Con la mano cerrada y los dedos índice, medio y pulgar estirados, se pone la yema del pulgar entre el índice y el medio.',
    'assets/topics/alphabet/Q.gif' : 'Q Con la mano cerrada, se ponen los dedos índice y pulgar en posición de garra. La palma mira hacia abajo, y se mueve la muñeca hacia los lados.',
    'assets/topics/alphabet/R.gif' : 'R Con la mano cerrada, se estiran y entrelazan los dedos índice y medio. La palma mira al frente.',
    'assets/topics/alphabet/RR.gif' : '',
    'assets/topics/alphabet/S.jpg' : 'S Con la mano cerrada, se pone el pulgar sobre los otros dedos. La palma mira al frente.',
    'assets/topics/alphabet/T.jpg' : 'T Con la mano cerrada, el pulgar se pone entre el índice y el medio. La palma mira al frente.',
    'assets/topics/alphabet/U.jpg' : 'U Con la mano cerrada, se estiran los dedos índice y medio unidos. La palma mira al frente.',
    'assets/topics/alphabet/V.jpg' : 'V Con la mano cerrada, se estiran los dedos índice y medio separados. La palma mira al frente.',
    'assets/topics/alphabet/W.jpg' : 'W Con la mano cerrada, se estiran los dedos índice, medio y anular separados. La palma mira al frente.',
    'assets/topics/alphabet/X.gif' : 'X Con la mano cerrada, el índice y el pulgar en posición de garra y la palma dirigida a un lado, se realiza un movimiento al frente y de regreso.',
    'assets/topics/alphabet/Y.jpg' : 'Y Con la mano cerrada, se estira el meñique y el pulgar. La palma mira hacia usted.',
    'assets/topics/alphabet/Z.gif' : 'Z Con la mano cerrada, el dedo índice estirado y la palma al frente, se dibuja una letra z en el aire.',
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
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
