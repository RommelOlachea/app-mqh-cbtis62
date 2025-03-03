import 'package:flutter/material.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Fondo con gradiente que ocupa toda la pantalla
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent], 
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(  // Disposición horizontal
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Contenedor con tuerca y versión
            Container(
              padding: EdgeInsets.all(20),
              child: Column(  // Columna para poner el ícono y el texto verticalmente
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings, // Icono de la tuerca
                    size: 60,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),  // Espacio entre el ícono y el texto
                  Text(
                    'Versión - en Alpha',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
