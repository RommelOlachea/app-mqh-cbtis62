import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePhotoScreen extends StatefulWidget {
  @override
  _ProfilePhotoScreenState createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen> {
  File? _imagenTemporal; // Imagen capturada pero aún no guardada
  File? _imagenGuardada; // Imagen guardada en almacenamiento local

  @override
  void initState() {
    super.initState();
    _cargarImagenGuardada();
  }

  // 📷 Método para tomar una foto con la cámara
  Future<void> _tomarFoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70, // 📌 Reduce el peso del archivo sin perder mucha calidad
    );

    if (imagen != null) {
      setState(() {
        _imagenTemporal = File(imagen.path);
      });
    }
  }

  // 💾 Método para guardar la imagen localmente
  Future<void> _guardarImagen() async {
    if (_imagenTemporal == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/perfil.jpg';

    // Copiar la imagen al almacenamiento local
    await _imagenTemporal!.copy(path);

    setState(() {
      _imagenGuardada = File(path);
      _imagenTemporal = null; // Limpiamos la imagen temporal después de guardar
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Imagen guardada correctamente')),
    );
  }

  // 🔄 Método para cargar la imagen guardada al iniciar la app
  Future<void> _cargarImagenGuardada() async {
    final directory = await getApplicationDocumentsDirectory();
    final String path = '${directory.path}/perfil.jpg';
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
      appBar: AppBar(title: Text("Capturar Foto de Perfil")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🖼 Mostrar imagen (guardada o nueva)
            CircleAvatar(
              radius: 130,
              backgroundImage: _imagenTemporal != null
                  ? FileImage(_imagenTemporal!)
                  : (_imagenGuardada != null ? FileImage(_imagenGuardada!) : null),
              child: (_imagenTemporal == null && _imagenGuardada == null)
                  ? Icon(Icons.person, size: 60)
                  : null,
            ),
            SizedBox(height: 20),

            // 📸 Botón para tomar una foto
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Tomar Foto"),
              onPressed: _tomarFoto,
            ),

            SizedBox(height: 10),

            // 💾 Botón para guardar la imagen (solo si hay una imagen temporal)
            if (_imagenTemporal != null)
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text("Utilizar Foto"),
                onPressed: _guardarImagen,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
          ],
        ),
      ),
    );
  }
}
