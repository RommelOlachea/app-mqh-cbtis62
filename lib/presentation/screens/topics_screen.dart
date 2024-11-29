import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF03A9F4), // Azul más intenso
              Color(0xFFB3E5FC), // Azul celeste claro
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hola Litzy!',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Enriquese el aprendizaje en LSM',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    // User Avatar
                    ClipOval(
                      child: Image.network(
                        'https://www.cecaes.edu.mx/blog/wp-content/uploads/2020/05/3-min.png', // URL de ejemplo para el avatar
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),

                // Cards Grid
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: const [
                      _AdCategoryCard(
                        title: 'Abecedario',
                        description: 'Aprende el abecedario en LSM.',
                        icon: Icons.abc,
                        backgroundColor: Colors.white,
                      ),
                      _AdCategoryCard(
                        title: 'Números',
                        description: 'Numeros del 1 al 20 en LSM.',
                        icon: Icons.numbers,
                        backgroundColor: Colors.white,
                      ),
                      _AdCategoryCard(
                        title: 'Dias de la semana',
                        description: 'Dias de la semana en LSM.',
                        icon: Icons.calendar_today,
                        backgroundColor: Colors.white,
                      ),
                      _AdCategoryCard(
                        title: 'Meses del año',
                        description: 'Meses del año en LSM.',
                        icon: Icons.calendar_view_month,
                        backgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24.0),

                // Special Offer Section
                const Text(
                  'Frases por categoría',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16.0),

                // Special Offer Carousel
                SizedBox(
                  height: 120.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _SpecialOfferCard(
                        title: "Frases dentro del salón!",
                        backgroundColor: Colors.blueAccent,
                      ),
                      _SpecialOfferCard(
                        title: "Instrucciones y preguntas escolares",
                        backgroundColor: Colors.orangeAccent,
                      ),
                      _SpecialOfferCard(
                        title: "Glosario de materias!",
                        backgroundColor: Colors.purpleAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AdCategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;

  const _AdCategoryCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.orange, size: 36.0),
          const SizedBox(height: 12.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpecialOfferCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const _SpecialOfferCard({
    Key? key,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16.0),
      width: 240.0,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Descubre más',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
