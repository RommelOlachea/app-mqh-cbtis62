import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separa arriba y abajo
          children: <Widget>[
            // Contenido en la parte superior con botón de retroceso
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botón de retroceso en la esquina superior izquierda
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context), // Regresa a la pantalla anterior
                    ),
                  ),
                  const SizedBox(height: 10), // Espacio debajo del botón

                  // Icono de configuración y texto
                  const Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
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

            // Contenido en el centro
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Configuraciones principales',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Editar Preferencias'),
                    ),
                  ],
                ),
              ),
            ),

            // Lista alineada abajo con Padding inferior
            Padding(
              padding: const EdgeInsets.only(bottom: 20), // Espacio en la parte inferior
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle, color: Colors.white),
                    title: Text("Editar Perfil", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.white),
                    title: Text("Acuerdos", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.white),
                    title: Text("Licencia", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.help, color: Colors.white),
                    title: Text("Ayuda", style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  // ListTile(
                  //   leading: Icon(Icons.logout, color: Colors.white),
                  //   title: Text("Cerrar sesión", style: TextStyle(color: Colors.white)),
                  //   onTap: () {},
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
