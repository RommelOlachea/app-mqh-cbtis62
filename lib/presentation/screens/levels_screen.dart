import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/presentation/widgets/user_avatar_image.dart';
import 'package:mqh_rommel/utils/utils_app.dart';
import 'package:path_provider/path_provider.dart';

class LevelsScreen extends ConsumerStatefulWidget {
  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends ConsumerState<LevelsScreen> {
  @override
  Widget build(BuildContext context) {
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.watch(authControllerProvider)!.email);

    return Scaffold(
      extendBodyBehindAppBar: true,
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
          padding: EdgeInsets.only(
            top: kToolbarHeight + 16, // Ajuste para respetar el AppBar
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
                      subtitle: 'Aprendiendo el abecedario',
                      color: Colors.redAccent,
                      icon: Icons.abc),
                  Row(
                    children: [
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 2',
                          subtitle: 'Aprendiendo el abecedario',
                          color: Colors.orange,
                          icon: Icons.text_fields,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 3',
                          subtitle: 'Aprendiendo el abecedario',
                          color: Colors.green,
                          icon: Icons.text_fields,
                        ),
                      ),
                    ],
                  ),
                ]),
                _buildSection("Números", [
                  _buildFullWidthLevel(
                      title: 'Nivel 4',
                      subtitle: 'Aprendiendo los números',
                      color: Colors.purpleAccent,
                      icon: Icons.numbers),
                  Row(
                    children: [
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 5',
                          subtitle: 'Aprendiendo los números',
                          color: Colors.blue,
                          icon: Icons.numbers,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 6',
                          subtitle: 'Aprendiendo los números',
                          color: Colors.blueGrey,
                          icon: Icons.numbers,
                        ),
                      ),
                    ],
                  ),
                ]),
                _buildSection("Calendario", [
                  _buildFullWidthLevel(
                      title: 'Nivel 7',
                      subtitle: 'Aprendiendo el calendario',
                      color: Colors.redAccent,
                      icon: Icons.calendar_month),
                  Row(
                    children: [
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 8',
                          subtitle: 'Aprendiendo el calendario',
                          color: Colors.orange,
                          icon: Icons.calendar_month,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildLevel(
                          title: 'Nivel 9',
                          subtitle: 'Aprendiendo el calendario',
                          color: Colors.green,
                          icon: Icons.calendar_month,
                        ),
                      ),
                    ],
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
    required Color color,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.7), size: 40),
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
    );
  }

  //widget del profe

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
      padding: const EdgeInsets.all(16),
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
    );
  }
}
