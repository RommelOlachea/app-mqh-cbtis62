import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool passwordVisible = false; // Control de visibilidad de la contraseña
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      // Realizar acción de inicio de sesión
      context.go('/home');
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
                          'assets/icon/logo_icon.jpeg', // Asegúrate de usar la ruta correcta
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
              // Título "Iniciar sesión" centrado y en color azul rey
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1), // Azul rey
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Formulario
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Campo para email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email), // Ícono de email
                          labelText: 'Email',
                          hintText: 'Ingrese su email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su email';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value)) {
                            return 'Email incorrecto';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      // Campo para contraseña
                      TextFormField(
                        controller: passwordController,
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.lock), // Ícono de candado
                          labelText: 'Contraseña',
                          hintText: 'Ingrese su contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su contraseña';
                          } else if (value.length < 6) {
                            return 'La contraseña debe tener al menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      // Checkbox y enlace de recuperación de contraseña
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value!;
                                  });
                                },
                              ),
                              const Text(
                                'Recuérdame',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              context.go('/forgotpassword'); // Navegar a recuperar contraseña
                            },
                            child: const Text(
                              '¿Olvidaste tu contraseña?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6E78F7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Botón de inicio de sesión
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _validateAndSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF0D47A1), // Azul rey
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Línea divisoria
                      Row(
                        children: const [
                          Expanded(
                            child: Divider(thickness: 1),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text('O inicia sesión con'),
                          ),
                          Expanded(
                            child: Divider(thickness: 1),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Iconos de redes sociales
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon:
                                const Icon(Icons.facebook, color: Colors.blue),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.apple, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.email, color: Colors.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Texto para registrarse si no tiene cuenta
                      TextButton(
                        onPressed: () {
                          context.push('/register'); // Navegar a registro
                        },
                        child: const Text(
                          '¿No tienes cuenta? Regístrate',
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
