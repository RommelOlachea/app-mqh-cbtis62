import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class UserAvatarImage extends StatelessWidget {
  final String imageProfile;
  final double radius;

  const UserAvatarImage({Key? key, required this.imageProfile, required this.radius}) : super(key: key);

  Future<String> _verificarImagen(String imageName) async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/$imageName.jpg';
    // Limpiar la caché de la imagen para forzar la actualización
    await FileImage(File(path)).evict();
    final File file = File(path);
    return await file.exists() ? path : "";
  }

  @override
Widget build(BuildContext context) {
  return FutureBuilder<String>(
    future: _verificarImagen(imageProfile),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Container(
          padding: EdgeInsets.all(2), // Ajusta el grosor del borde
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1), // Borde blanco
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        return Container(
          padding: EdgeInsets.all(2), // Ajusta el grosor del borde
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 1), // Borde blanco
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: Colors.white,
            backgroundImage: FileImage(File(snapshot.data!)),
          ),
        );
      }

      return Container(
        padding: EdgeInsets.all(4), // Ajusta el grosor del borde
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4), // Borde blanco
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/profile/icono_perfil4.png'),
        ),
      );
    },
  );
}

}
