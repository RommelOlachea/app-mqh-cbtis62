import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulación de experiencia y la experiencia total para el siguiente nivel
    double currentExp = 50;  // Experiencia actual (puedes cambiar este valor dinámicamente)
    double totalExpForNextLevel = 100; // Total de experiencia para el siguiente nivel

    // Cálculo del porcentaje de progreso
    double progress = currentExp / totalExpForNextLevel;

    // Ruta de la foto de perfil
    String profilePicturePath = 'assets/profile/icono_perfil4.png'; // Cambia esta ruta por la tuya

    return Scaffold(
      body: Container(
        // Fondo con gradiente
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent], // Colores del gradiente
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Contenedor para la imagen.
            Stack(
              children: [
                Container(
                  height: 400,
                  color: Colors.white,
                ),
                // Imagen con bordes redondeados (foto de perfil)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Center(  // Aseguramos que esté centrado
                      child: SizedBox(
                        width: 300,  // Define el tamaño deseado de la imagen
                        height: 300, // Mantén el tamaño fijo
                        child: Image.asset(
                          profilePicturePath,
                          fit: BoxFit.cover, // La imagen debe cubrir todo el espacio
                          alignment: Alignment.center, // Centrado
                          // En caso de que la imagen no se cargue, mostrar el ícono de usuario
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.account_circle, // Ícono de usuario si no se carga la imagen
                              size: 300,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Fila debajo de la imagen con nombre y nivel.
            Container(
              color: Colors.white, // Fondo blanco para la franja
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nombre a la izquierda
                  Text(
                    "Romina",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // Nivel a la derecha
                  Text(
                    "Nivel: 5", // Cambia este valor dinámicamente si es necesario
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Barra de progreso de experiencia
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Experiencia:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Barra de progreso
                  Stack(
                    children: [
                      // Barra de fondo
                      Container(
                        height: 12,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Color de fondo (lo que falta)
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      // Barra de progreso (color basado en la experiencia actual)
                      Container(
                        height: 12,
                        width: MediaQuery.of(context).size.width * progress, // Ancho basado en el porcentaje de progreso
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFFBA68C8), Color(0xFF8E24AA)], // Gradiente morado
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      // Indicadores de progreso
                      Positioned(
                        left: MediaQuery.of(context).size.width * progress - 5,
                        top: -3,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFF8E24AA), width: 3), // Borde morado
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Exp: $currentExp/$totalExpForNextLevel",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "Siguiente nivel",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Línea divisoria
            Divider(
              thickness: 1,
              color: Colors.grey[400],
              indent: 20,
              endIndent: 20,
            ),
            // Usamos Expanded para centrar los botones
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Botón para editar usuario
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFBA68C8), Color(0xFF8E24AA)], // Gradiente morado
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30), // Bordes redondeados
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          // Acción al presionar el botón de "Editar usuario"
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Editar Usuario",
                          style: TextStyle(
                            color: Colors.white, // Texto blanco
                            fontSize: 18, // Tamaño del texto
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espacio entre los botones
                    // Botón para editar foto de perfil
                    Container(
                      width: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFBA68C8), Color(0xFF8E24AA)], // Gradiente morado
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30), // Bordes redondeados
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          // Acción al presionar el botón de "Editar foto de perfil"
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Editar Foto de Perfil",
                          style: TextStyle(
                            color: Colors.white, // Texto blanco
                            fontSize: 18, // Tamaño del texto
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}