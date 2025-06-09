import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('LSM en México', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF36D1DC),
              Color(0xFF5B86E5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text(
                    'Lengua de Señas Mexicana (LSM)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Historia
                  const Text(
                    '📜 Historia y Reconocimiento',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'La LSM se formó a finales del siglo XIX combinando signos locales e influencias de la Seña Americana. ' 
                    'En 2005 fue oficialmente reconocida por la Ley General para la Inclusión de las Personas con Discapacidad, ' 
                    'garantizando el derecho a la comunicación de la comunidad sorda.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 24),

                  // Características
                  const Text(
                    '🧩 Características Lingüísticas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Lenguaje visual-gestual con gramática propia.'
                    '• Uso de expresiones faciales y espaciales para construir sintaxis.'
                    '• Dialectos regionales en distintos estados del país.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 24),

                  // Estadísticas
                  const Text(
                    '📊 Estadísticas en México',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• 4.9% de la población padece hipoacusia (~6.2 millones), de los cuales 300,000 utilizan LSM.'
                    '• Solo el 12% de instituciones educativas de nivel básico integran programas de LSM.'
                    '• Existen 20 centros de formación y más de 50 intérpretes acreditados a nivel nacional.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 24),

                  // Importancia
                  const Text(
                    '🌟 Importancia y Aplicaciones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'La LSM es clave para:'
                    '• Asegurar el acceso a la educación y la justicia.'
                    '• Facilitar la inclusión laboral y social.'
                    '• Mejorar la atención médica y servicios públicos.'
                    '• Promover la equidad y los derechos humanos.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 24),

                  // Recursos
                  const Text(
                    '📚 Recursos y Formación',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Diccionario de LSM (Ed. SEP).'
                    '• Plataformas en línea: SignaLearn, HandTalk.'
                    '• Cursos oficiales: SEP, INEA y universidades públicas.'
                    '• Apps móviles de aprendizaje interactivo.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    'Fuente: INEGI 2020, SEP, CNDH',
                    style: TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
