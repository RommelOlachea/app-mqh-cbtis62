import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/controllers/levels_controller.dart';
import 'package:mqh_rommel/data/models/levels_model.dart';
import 'package:mqh_rommel/presentation/widgets/user_avatar_image.dart';
import 'package:mqh_rommel/utils/utils_app.dart';


class LevelsScreen extends ConsumerStatefulWidget {
  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends ConsumerState<LevelsScreen> {
  


  @override
  Widget build(BuildContext context) {
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.watch(authControllerProvider)!.email);
    final levels = ref.watch(levelsControllerProvider);
    
    
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
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'NIVELES',
            style: TextStyle(
              color: Colors.white,
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
        body: Padding(
          padding: EdgeInsets.only(
            top: 16, // Ajuste para respetar el AppBar
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSection("Abecedario", [
                  _buildFullWidthLevel(
                    title: 'Nivel 1',
                    subtitle: 'Reforzando las vocales',
                    gradientColors: [Color(0xFFFF8A65), Color(0xFFD84315)],
                    image: 'assets/icon/topics/abecedario2.png',
                    route: '/vocalquiz',
                    active: true,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 2',
                          subtitle: 'Reforzando el abecedario',
                          color: (levels?.level1 ?? false) ? Colors.orange : Colors.grey,
                          image: 'assets/icon/topics/abecedario.png',
                          route: '/alphabetquiz',
                          active: levels?.level1 ?? false,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 3',
                          subtitle: 'Juego de memoria del abecedario',
                          color: (levels?.level2 ?? false) ? Colors.green : Colors.grey,
                          image: 'assets/icon/game/memoria.png',
                          route: '/alphabeticgame',
                          active: levels?.level2 ?? false,
                        ),
                      ),
                    ],
                  ),
                ]),
                _buildSection("Números", [
                  _buildFullWidthLevel(
                    title: 'Nivel 4',
                    subtitle: 'Aprendiendo los números [1-10]',
                    gradientColors: (levels?.level3 ?? false) ?  [Color(0xFFBA68C8), Color(0xFF8E24AA)] : [Colors.grey, Colors.grey],
                    image: 'assets/icon/topics/numeros.png',
                    route: '/numbersaquiz',
                    active: levels?.level3 ?? false,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 5',
                          subtitle: 'Aprendiendo los números [11-20, 100]',
                          color: (levels?.level4 ?? false) ? Colors.blue : Colors.grey,
                          image: 'assets/icon/topics/abecedario.png',
                          route: '/numbersbquiz',
                          active: levels?.level4 ?? false,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 6',
                          subtitle: 'Juego de memoria de los números',
                          color: (levels?.level5 ?? false) ? Colors.blueGrey : Colors.grey,
                          image: 'assets/icon/game/memoria.png',
                          route: '/numbersgame',
                          active: levels?.level5 ?? false,
                        ),
                      ),
                    ],
                  ),
                ]),
                _buildSection("Calendario", [
                  _buildFullWidthLevel(
                    title: 'Nivel 7',
                    subtitle: 'Aprendiendo los días de la semana',
                    gradientColors: (levels?.level6 ?? false) ? [Color(0xFFFF8A65), Color(0xFFD84315)] : [Colors.grey, Colors.grey],
                    image: 'assets/icon/topics/calendary2.png',
                    route: '/daysweekquiz',
                    active: levels?.level6 ?? false, 
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 8',
                          subtitle: 'Meses y estaciones del año',
                          color: (levels?.level7 ?? false) ? Colors.orange : Colors.grey,
                          image: 'assets/icon/topics/month.png',
                          route: '/monthseasonsquiz',
                          active: levels?.level7 ?? false,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 9',
                          subtitle: 'Memoria del calendario',
                          color: (levels?.level8 ?? false) ? Colors.green : Colors.grey,
                          image: 'assets/icon/topics/seasons2.png',
                          route: '/calendargame',
                          active: levels?.level8 ?? false,
                        ),
                      ),
                    ],
                  ),
                ]),
                _buildSection("Preposiciones", [
                  _buildFullWidthLevel(
                    title: 'Nivel 10',
                    subtitle: 'Aprendiendo las preposiciones',
                    gradientColors: (levels?.level9 ?? false) ? [Color(0xFFFF8A65), Color(0xFFD84315)] : [Colors.grey, Colors.grey],
                    image: 'assets/icon/topics/preposiciones.png',
                    route: '/daysweekquiz',
                    active: levels?.level9 ?? false, 
                  ),
                  const Row(
                    children: [],
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //widget hecho con ayuda manu

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...children,
        const SizedBox(height: 16),
      ],
    );
  }

  //widget hecho con ayuda manu

  Widget _buildFullWidthLevel({
    required String title,
    required String subtitle,
    required List<Color> gradientColors,
    required String image,
    required String route,
    required bool active,
  }) {
    return GestureDetector(
      onTap: () {
        if(active)GoRouter.of(context).push(route);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 50.0, // Ajusta el tamaño según sea necesario
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //widget del profe

  Widget _buildLevel({
    required String title,
    required String subtitle,
    required Color color,
    required String image,
    required String route,
    required bool active,
  }) {
    return GestureDetector(
      onTap: () {
        if(active)GoRouter.of(context).push(route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child:  Image.asset(
              image,
              height: 30.0, // Ajusta el tamaño según sea necesario
              fit: BoxFit.cover,
            ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
