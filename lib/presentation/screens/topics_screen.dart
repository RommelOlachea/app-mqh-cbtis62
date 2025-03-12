import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/presentation/widgets/user_avatar_image.dart';
import 'package:mqh_rommel/utils/utils_app.dart';

class TopicsScreen extends ConsumerStatefulWidget {
  @override
  _TopicsScreenState createState() => _TopicsScreenState();
}

class _TopicsScreenState extends ConsumerState<TopicsScreen> {
  @override
  void initState() {
    super.initState();
    // _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.watch(authControllerProvider)!.email);
    String username = ref.watch(authControllerProvider)!.name;

    return Scaffold(
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
                          text: TextSpan(
                            style: const TextStyle(
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
                                text: username,
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
                    UserAvatarImage(
                      imageProfile: imageProfile,
                      radius: 35,
                      color: Colors.white,
                      width: 1,
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
                        image: 'assets/icon/topics/abecedario2.png',
                        gradientColors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                        route: '/alphabet',
                      ),
                      _AdTopic(
                        title: 'Números',
                        description: 'Números del 1 al 20 en LSM.',
                        image: 'assets/icon/topics/numeros.png',
                        gradientColors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                        route: '/numbers',
                      ),
                      _AdTopic(
                        title: 'Calendario',
                        description: 'Días, meses y estaciones en LSM.',
                        image: 'assets/icon/topics/calendary2.png',
                        gradientColors: [Color(0xFFBA68C8), Color(0xFF8E24AA)],
                        route: '/calendary',
                      ),
                      _AdTopic(
                        title: 'Preposiciones',
                        description: 'Manejo del tiempo en LSM.',
                        image: 'assets/icon/topics/preposiciones.png',
                        gradientColors: [Color(0xFFFF8A65), Color(0xFFD84315)],
                        route: '/prepositions',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24.0),

                // Special Offer Section
                const Text(
                  'Amplía tu conocimiento',
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
                        title: "Indicaciones dentro del salón",
                        image:'assets/icon/topics/indicaciones3.png',
                        gradientColors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                        route: '/instructions',
                      ),
                      _AddCategory(
                        title: "Preguntas frecuentes",
                         image:'assets/icon/topics/preguntas.png',
                        gradientColors:  [Color(0xFFFFA726), Color(0xFFFF7043)],
                        route: '/questions',
                      ),
                      _AddCategory(
                        title: "Glosario de materias!",
                         image:'assets/icon/topics/glosario2.png',
                        gradientColors:  [Color(0xFFBA68C8), Color(0xFF8E24AA)],
                        route: '/glossary',
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
  final String image;
  final List<Color> gradientColors;
  final String route;

  const _AdTopic({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.gradientColors,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(route);
      },
      child: Expanded(
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
              // Icon(icon, color: Colors.white, size: 36.0),
              Image.asset(
                image,
                height: 50.0, // Ajusta el tamaño según sea necesario
                fit: BoxFit.cover,
              ),
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
      ),
    );
  }
}

class _AddCategory extends StatelessWidget {
  final String title;
  final String image;
  final List<Color> gradientColors;
  final String route;

  const _AddCategory({
    Key? key,
    required this.title,
    required this.image,
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
        margin: const EdgeInsets.only(right: 16.0),
        width: 250.0,
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
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
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
            // const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Image.asset(
                image,
                height: 40.0, // Ajusta el tamaño según sea necesario
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
