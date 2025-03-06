import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/presentation/widgets/user_avatar_image.dart';
import 'package:mqh_rommel/utils/utils_app.dart';

class CalendaryScreen extends ConsumerStatefulWidget {
  @override
  _CalendaryScreenState createState() => _CalendaryScreenState();
}

class _CalendaryScreenState extends ConsumerState<CalendaryScreen> {
  @override
  Widget build(BuildContext context) {
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.watch(authControllerProvider)!.email);

    return Scaffold(
      extendBodyBehindAppBar: true, // Extiende el cuerpo detrás del AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Hace el AppBar transparente
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'CALENDARIO',
          style: TextStyle(
            color: Colors
                .white, // Cambia el color del texto a blanco para contraste
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: UserAvatarImage(
              imageProfile: imageProfile,
              radius: 25,
              color: Colors.white,
              width: 1,
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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AddCategory(
                title: 'Días de la semana',
                image: 'assets/icon/topics/week.png',
                gradientColors: [Color(0xFF66BB6A), Color(0xFF43A047)],
                route: '/daysofweek',
              ),
              SizedBox(height: 16),
              _AddCategory(
                title: "Meses del año",
                image: 'assets/icon/topics/month.png',
                gradientColors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                route: '/months',
              ),
              SizedBox(height: 16),
              _AddCategory(
                title: "Estaciones del año",
                image: 'assets/icon/topics/seasons2.png',
                gradientColors: [Color(0xFFBA68C8), Color(0xFF8E24AA)],
                route: '/seasons',
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
  final List<Color> gradientColors;
  final String image;
  final String route;

  const _AddCategory({
    Key? key,
    required this.title,
    required this.gradientColors,
    required this.image,
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
        width: 200.0,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Center(
              child: Image.asset(                
                image,
                height: 50.0, // Ajusta el tamaño según sea necesario
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
