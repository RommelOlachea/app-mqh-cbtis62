import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class TopicsScreen extends StatefulWidget {
  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  
final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String _username = ''; 

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    String? storedUsername = await _secureStorage.read(key: 'username');
    setState(() {
      _username = storedUsername ?? 'Usuario';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent],
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
                      children: [
                        RichText(
                          text:  TextSpan(
                            style:const TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Hola, ',
                              ),
                              TextSpan(
                                text: _username,
                                style: const TextStyle(
                                  color: Color(0xFFFFD54F), // Dorado claro
                                ),
                              ),
                              const TextSpan(
                                text: ' 👋',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Enriquece el aprendizaje en LSM',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    // User Avatar
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/profile/icono_perfil4.png'),
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
                      _AdTopic(
                        title: 'Abecedario',
                        description: 'Aprende el abecedario en LSM.',
                        icon: Icons.abc,
                        gradientColors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                        route: '/alphabet',
                      ),
                      _AdTopic(
                        title: 'Números',
                        description: 'Números del 1 al 20 en LSM.',
                        icon: Icons.numbers,
                        gradientColors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                        route: '/numbers',
                      ),
                      _AdTopic(
                        title: 'Días de la semana',
                        description: 'Días de la semana en LSM.',
                        icon: Icons.calendar_today,
                        gradientColors: [Color(0xFFBA68C8), Color(0xFF8E24AA)],
                        route: '/development',
                      ),
                      _AdTopic(
                        title: 'Meses del año',
                        description: 'Meses del año en LSM.',
                        icon: Icons.calendar_view_month,
                        gradientColors: [Color(0xFFFF8A65), Color(0xFFD84315)],
                        route: '/development',
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
                      _AddCategory(
                        title: "Frases dentro del salón!",
                        backgroundColor: Colors.green,
                        route: '/development',
                      ),
                      _AddCategory(
                        title: "Instrucciones y preguntas escolares",
                        backgroundColor: Colors.orangeAccent,
                        route: '/development',
                      ),
                      _AddCategory(
                        title: "Glosario de materias!",
                        backgroundColor: Colors.purpleAccent,
                        route: '/development',
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

class _AdTopic extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final List<Color> gradientColors;
  final String route;

  const _AdTopic({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.gradientColors,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(route);
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
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
            Icon(icon, color: Colors.white, size: 36.0),
            const SizedBox(height: 12.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddCategory extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String route;

  const _AddCategory({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(route);
      },
      child: Container(
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
      ),
    );
  }
}
