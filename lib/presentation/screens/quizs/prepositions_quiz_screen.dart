import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqh_rommel/constants/app_constants.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/controllers/levels_controller.dart';

class PrepositionsSquizScreen extends ConsumerStatefulWidget {
  const PrepositionsSquizScreen({Key? key}) : super(key: key);

  @override
  _PrepositionsSquizScreenState createState() => _PrepositionsSquizScreenState();
}

class _PrepositionsSquizScreenState extends ConsumerState<PrepositionsSquizScreen> {
  final Map<String, String> allLetters = AppConstants().prepositions;

  late List<_Question> questions;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool quizFinished = false;

  @override
  void initState() {
    super.initState();
    _generateQuestions();
  }

  /// Genera 10 preguntas aleatorias (o tantas como quieras) a partir de [allLetters].
  void _generateQuestions() {
    final entries = allLetters.entries.toList()..shuffle();
    // Tomamos 10 (o el total, si hay menos de 10).
    final selected = entries.take(7).toList();

    questions = selected.map((entry) {
      final imagePath = entry.key;
      final correctLetter = _getLetterFromMedia(imagePath);
      final distractors = _getRandomLettersExcept(correctLetter, 3);
      final options = [correctLetter, ...distractors]..shuffle();

      return _Question(
        imagePath: imagePath,
        correctLetter: correctLetter,
        options: options,
      );
    }).toList();
  }

  /// Extrae la letra (ej. "A", "B") de la ruta de la imagen
  String _getLetterFromMedia(String mediaPath) {
    return mediaPath.split('/').last.split('.').first.toUpperCase();
  }

  /// Retorna [count] letras aleatorias distintas de [except].
  List<String> _getRandomLettersExcept(String except, int count) {
    final allPossibleLetters =
        allLetters.keys.map(_getLetterFromMedia).toSet().toList();
    allPossibleLetters.remove(except);
    allPossibleLetters.shuffle();
    return allPossibleLetters.take(count).toList();
  }

  /// Maneja la selección de la opción por parte del usuario.
  void _onOptionSelected(String selectedOption) {
    final currentQuestion = questions[currentQuestionIndex];
    final bool isCorrect = (selectedOption == currentQuestion.correctLetter);

    if (isCorrect) {
      correctAnswers++;
    }

    // Muestra un cuadro de diálogo indicando si fue correcto o no
    showDialog(
      context: context,
      barrierDismissible: false, // Deshabilita cerrar al tocar fuera
      builder: (_) => AlertDialog(
        title: Text(isCorrect ? "¡Correcto!" : "Incorrecto"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Mensaje de texto
            isCorrect
                ? const Text("¡Bien hecho! Esa es la respuesta correcta.")
                : Text(
                    "La respuesta correcta era: ${currentQuestion.correctLetter}"),
            const SizedBox(height: 16),
            // Imagen según sea correcto o incorrecto
            Image.asset(
              isCorrect
                  ? 'assets/icon/quiz/correcto.png'
                  : 'assets/icon/quiz/incorrecto1.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _goToNextQuestion();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  /// Avanza a la siguiente pregunta o finaliza el quiz
  void _goToNextQuestion() {
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex >= questions.length) {
        quizFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizFinished) {
      return _buildResultScreen();
    }

    final currentQuestion = questions[currentQuestionIndex];
    final questionNumber = currentQuestionIndex + 1;
    final total = questions.length;

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
          title: Text(
            "Pregunta $questionNumber / $total",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 23),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            const SizedBox(height: 24),
            // Imagen de la letra en LSM
            SizedBox(
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  currentQuestion.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Opciones de respuesta
            Expanded(
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  final option = currentQuestion.options[index];
                  return Card(
                    color: Colors.white.withOpacity(0.6),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          height: 35,
                          width: 35,
                          'assets/icon/quiz/check3.png', // Ajusta la ruta de tu imagen
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        option,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: () => _onOptionSelected(option),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Construye la pantalla de resultados al finalizar
  Widget _buildResultScreen() {
    final totalQuestions = questions.length;
    final scorePercentage = (correctAnswers / totalQuestions) * 100;
    final passed = scorePercentage >= 80.0;
    final levelsController = ref.read(levelsControllerProvider.notifier);
    final userId = ref.read(authControllerProvider)!.id;

    if (passed) {
      // Aquí puedes actualizar el nivel del usuario
      levelsController.updateLevel(
        userId,
        10,
        completion: true,
        calification: scorePercentage,
      );
    }

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
            title: const Text(
              "Resultado del Quiz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.transparent),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                passed
                    ? Image.asset(
                        height: 110,
                        width: 110,
                        'assets/icon/quiz/check3.png', // Ajusta la ruta de tu imagen
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        height: 100,
                        width: 100,
                        'assets/icon/quiz/incorrecto.png', // Ajusta la ruta de tu imagen
                        fit: BoxFit.cover,
                      ),
                SizedBox(
                  height: 50,
                ),
                const Text(
                  "¡Quiz finalizado!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text("Preguntas correctas: $correctAnswers / $totalQuestions",
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
                Text("Porcentaje: ${scorePercentage.toStringAsFixed(2)}%",
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
                const SizedBox(height: 16),
                Text(
                  textAlign: TextAlign.center,
                  passed
                      ? "¡Felicidades! Has aprobado."
                      : "Se require al menos 80% \n Inténtalo de nuevo",
                  style: TextStyle(
                    fontSize: 18,
                    color: passed ? Colors.lightGreen : Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Salir"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Clase interna para representar cada pregunta del quiz
class _Question {
  final String
      imagePath; // Ruta de la imagen (ej: 'assets/topics/alphabet/A.jpg')
  final String correctLetter; // Letra correcta (ej: 'A')
  final List<String> options; // Lista de opciones (ej: ['A','F','M','Z'])

  _Question({
    required this.imagePath,
    required this.correctLetter,
    required this.options,
  });
}
