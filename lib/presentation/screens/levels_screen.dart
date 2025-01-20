import 'package:flutter/material.dart';

class LevelsScreen extends StatefulWidget {
  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extiende el cuerpo detrás del AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Hace el AppBar transparente
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'NIVELES',
          style: TextStyle(
            color: Colors.white, // Cambia el color del texto a blanco para contraste
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/profile/icono_perfil4.png'), // Asegúrate de tener esta imagen en assets
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.2,
                  children: [
                    _buildLevel(
                      title: 'Abecedario',
                      subtitle: 'Aprendiendo las letras',
                      color: Colors.redAccent,
                      icon: Icons.abc,
                    ),
                    _buildLevel(
                      title: 'Números',
                      subtitle: 'Aprendiendo los números 1-20,100',
                      color: Colors.purpleAccent,
                      icon: Icons.numbers,
                    ),
                    _buildLevel(
                      title: 'Días de la semana',
                      subtitle: 'Aprendiendo los días de la semana',
                      color: Colors.grey,
                      icon: Icons.weekend_sharp,
                    ),
                    _buildLevel(
                      title: 'Meses',
                      subtitle: 'Aprendiendo los meses del año',
                      color: Colors.grey,
                      icon: Icons.calendar_month,
                    ),
                    _buildLevel(
                      title: 'Frases',
                      subtitle: 'Dentro del salón',
                      color: Colors.grey,
                      icon: Icons.people,
                    ),
                    _buildLevel(
                      title: 'Frases',
                      subtitle: 'Preguntas escolares',
                      color: Colors.grey,
                      icon: Icons.people,
                    ),
                    _buildLevel(
                      title: 'Frases',
                      subtitle: 'Glosario de materias',
                      color: Colors.grey,
                      icon: Icons.people,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevel({
    required String title,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(icon, color: Colors.white.withOpacity(0.7)),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Flexible(
            child: Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
              maxLines: 2, // Limita el número de líneas a 2 para evitar desbordamiento
              overflow: TextOverflow.ellipsis, // Agrega puntos suspensivos si el texto es muy largo
            ),
          ),
        ],
      ),
    );
  }
}
