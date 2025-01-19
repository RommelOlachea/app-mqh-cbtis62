import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForgotPassword() {
    if (_formKey.currentState!.validate()) {
      // Realizar acción para enviar correo de recuperación
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Correo de recuperación enviado')),
      );
    }
  }

  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideKeyboard, // Detectar toque fuera del teclado
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // AppBar con imagen de fondo y borde inferior invertido
              Container(
                height: 280, // Mayor altura para el AppBar
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    // Imagen de fondo
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/icon/logo_icon.jpeg', // Imagen de fondo
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Contenedor blanco para el borde inferior invertido
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Título "Recordar Contraseña" centrado
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Recordar Contraseña',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1), // Azul rey
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Instrucción
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Introduce tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              // Formulario
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Campo para Email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email), // Ícono de email
                          labelText: 'Email',
                          hintText: 'Introduce tu email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Por favor introduzca un email válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      // Botón para enviar correo de recuperación
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _submitForgotPassword,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF0D47A1), // Azul rey
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Enviar enlace',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Enlace para volver al login
                      TextButton(
                        onPressed: () {
                          context.go('/login'); // Volver a la pantalla anterior
                        },
                        child: const Text(
                          'Volver al inicio de sesión',
                          style: TextStyle(color: Color(0xFF6E78F7)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
