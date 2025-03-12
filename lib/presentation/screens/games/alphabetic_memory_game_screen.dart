import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mqh_rommel/constants/app_constants.dart';

class AlphabeticMemoryGameScreen extends StatefulWidget {
  const AlphabeticMemoryGameScreen({Key? key}) : super(key: key);

  @override
  _AlphabeticMemoryGameScreenState createState() => _AlphabeticMemoryGameScreenState();
}

class _AlphabeticMemoryGameScreenState extends State<AlphabeticMemoryGameScreen> {
  final Map<String, String> allLetters = AppConstants().alphabetic;

  // Lista de tarjetas
  late List<_MemoryCard> _cards;
  // Índices de las dos tarjetas seleccionadas
  int? _selectedIndex1;
  int? _selectedIndex2;
  // Contador de pares encontrados
  int _matchesFound = 0;
  // Cantidad de pares que queremos (10)
  final int _pairsToPlay = 10;

  @override
  void initState() {
    super.initState();
    _initGame();
  }

  /// Inicializa el juego con 10 letras aleatorias (20 tarjetas en total).
  void _initGame() {
    // Convertimos el map a lista y mezclamos
    final entries = allLetters.entries.toList()..shuffle();
    // Seleccionamos 10 entradas
    final selected = entries.take(_pairsToPlay).toList();

    // Creamos la lista de tarjetas (cada letra duplicada)
    _cards = [];
    for (var entry in selected) {
      final imagePath = entry.key;                  // Ej: "assets/topics/alphabet/A.jpg"
      final letter = _extractLetter(imagePath);     // Ej: "A"

      _cards.add(_MemoryCard(imagePath: imagePath, letter: letter));
      _cards.add(_MemoryCard(imagePath: imagePath, letter: letter));
    }

    // Mezclamos las 20 tarjetas
    _cards.shuffle();

    _matchesFound = 0;
    _selectedIndex1 = null;
    _selectedIndex2 = null;
  }

  /// Extrae la letra (ej. "A") del nombre de archivo "assets/topics/alphabet/A.jpg"
  String _extractLetter(String path) {
    return path.split('/').last.split('.').first.toUpperCase();
  }

  /// Maneja el tap en una tarjeta
  void _onCardTap(int index) {
    final card = _cards[index];

    // Si la tarjeta ya está volteada o emparejada, no hacemos nada
    if (card.isFlipped || card.isMatched) return;

    setState(() {
      // Volteamos la tarjeta seleccionada
      card.isFlipped = true;

      if (_selectedIndex1 == null) {
        // Primer tap
        _selectedIndex1 = index;
      } else if (_selectedIndex2 == null) {
        // Segundo tap
        _selectedIndex2 = index;

        // Verificamos si ambas coinciden
        _checkMatch();
      }
    });
  }

  /// Verifica si las dos tarjetas seleccionadas hacen match
  void _checkMatch() async {
    if (_selectedIndex1 == null || _selectedIndex2 == null) return;

    final card1 = _cards[_selectedIndex1!];
    final card2 = _cards[_selectedIndex2!];

    if (card1.letter == card2.letter) {
      // ¡Coincidencia!
      setState(() {
        card1.isMatched = true;
        card2.isMatched = true;
        _matchesFound++;
      });
      _checkGameOver();
    } else {
      // No coinciden, las volteamos de nuevo después de una pequeña pausa
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        card1.isFlipped = false;
        card2.isFlipped = false;
      });
    }

    // Reseteamos los índices
    setState(() {
      _selectedIndex1 = null;
      _selectedIndex2 = null;
    });
  }

  /// Verifica si el juego ha terminado (se han encontrado todos los pares)
  void _checkGameOver() {
    if (_matchesFound >= _pairsToPlay) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text("¡Felicidades!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Has completado el juego de memoria."),
              Image.asset(
          'assets/icon/quiz/correcto.png',
          width: 100,
          height: 100,
        ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                Navigator.pop(context); // Regresa a la pantalla anterior
              },
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          title: const Text("Juego de Memoria", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),),          
        ),
        body: _buildGameBoard(),
      ),
    );
  }

  /// Construye el tablero de juego (grid con las tarjetas)
  Widget _buildGameBoard() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 4 columnas, ajusta según prefieras
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: _cards.length,
      itemBuilder: (context, index) {
        final card = _cards[index];
        return GestureDetector(
          onTap: () => _onCardTap(index),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: card.isFlipped || card.isMatched
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      card.imagePath,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.help_outline,
                    size: 48,
                    color: Colors.deepPurple,
                  ),
          ),
        );
      },
    );
  }
}

/// Modelo de tarjeta en el juego de memoria
class _MemoryCard {
  final String imagePath; // Ruta de la imagen
  final String letter;    // Letra extraída (A, B, C...)
  bool isFlipped;
  bool isMatched;

  _MemoryCard({
    required this.imagePath,
    required this.letter,
    this.isFlipped = false,
    this.isMatched = false,
  });
}
