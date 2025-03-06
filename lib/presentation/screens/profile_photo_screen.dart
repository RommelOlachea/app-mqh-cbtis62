import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/utils/utils_app.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePhotoScreen extends ConsumerStatefulWidget {
  @override
  _ProfilePhotoScreenState createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends ConsumerState<ProfilePhotoScreen> {
  File? _imagenTemporal; // Imagen capturada pero aún no guardada
  File? _imagenGuardada; // Imagen guardada en almacenamiento local

  @override
  void initState() {
    super.initState();
    _cargarImagenGuardada();
  }

  //Método para tomar una foto con la cámara
  Future<void> _tomarFoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70, //Reduce el peso del archivo sin perder mucha calidad
    );

    if (imagen != null) {
      setState(() {
        _imagenTemporal = File(imagen.path);
      });
    }
  }

  //Método para guardar la imagen localmente
  Future<void> _guardarImagen() async {
    if (_imagenTemporal == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final String email = ref.read(authControllerProvider)!.email;
    final String imageName = UtilsApp.cleanEmailUsername(email);

    final String path = '${directory.path}/$imageName.jpg';

    // Copiar la imagen al almacenamiento local
    await _imagenTemporal!.copy(path);

    // Limpiar la caché de la imagen para forzar la actualización
    await FileImage(File(path)).evict();

    setState(() {
      _imagenGuardada = File(path);
      //_imagenGuardada = _imagenTemporal;
      _imagenTemporal = null; // Limpiamos la imagen temporal después de guardar
    });

    final authController = ref.read(authControllerProvider.notifier);
    authController.forceUpdate();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Imagen guardada correctamente')),
    );
  }

  //Método para cargar la imagen guardada al iniciar la app
  Future<void> _cargarImagenGuardada() async {
    final directory = await getApplicationDocumentsDirectory();
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.read(authControllerProvider)!.email);
    final String path = '${directory.path}/$imageProfile.jpg';
    // Limpiar la caché de la imagen para forzar la actualización
    await FileImage(File(path)).evict();
    File imagenFile = File(path);

    if (await imagenFile.exists()) {
      setState(() {
        _imagenGuardada = imagenFile;
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true, // Extiende el body detrás del AppBar
    appBar: AppBar(
      title: const Text("Editar Foto de Perfil", style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.transparent, // Hace que el AppBar sea transparente
      elevation: 0, // Quita la sombra del AppBar
    ),
    body: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[900]!, Colors.blueAccent],
          begin: Alignment.topCenter, // Inicia el degradado desde arriba
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 130,
            backgroundImage: _imagenTemporal != null
                ? FileImage(_imagenTemporal!)
                : (_imagenGuardada != null
                    ? FileImage(_imagenGuardada!)
                    : null),
            child: (_imagenTemporal == null && _imagenGuardada == null)
                ? const Icon(Icons.person, size: 60)
                : null,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.camera_alt),
            label: const Text("Tomar Foto"),
            onPressed: _tomarFoto,
          ),
          const SizedBox(height: 10),
          if (_imagenTemporal != null)
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Utilizar Foto"),
              onPressed: _guardarImagen,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            ),
        ],
      ),
    ),
  );
}

}
