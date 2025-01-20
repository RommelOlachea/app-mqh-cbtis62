import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  void _validateAndRegister() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro exitoso')),
      );
    }
  }

  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _hideKeyboard,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  ),
                ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              child: Image.asset(
                                'assets/icon/logo_icon.jpeg',

                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Registro de Usuario',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D47A1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                labelText: 'ID Usuario',
                                hintText: 'Nombre de Usuario',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese su nombre';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email),
                                labelText: 'Email',
                                hintText: 'introduzca su email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor ingrese su email';
                                } else if(!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                                  return 'Introduzca un email válido';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),

                            TextFormField(
                              controller: passwordController,
                              obscureText: !passwordVisible,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),

                                labelText: 'Contraseña',
                                hintText: 'Introduzca su contraseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
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
                                  return'Por favor ingrese su contraseña';
                                } else if (value.length < 6) {
                                  return 'La contraseña debe tener al menos 6 caracteres';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),

                            TextFormField(
                              controller: confirmPasswordController,
                              obscureText: !confirmPasswordVisible,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),

                                labelText: 'Confirmar Contraseña',
                                hintText: 'Confirme su contraseña',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    confirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      confirmPasswordVisible = !confirmPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Por favor confirme su contraseña';
                                  } else if (value != passwordController.text) {
                                    return 'Las contraseñas no coinciden';
                                  }
                                  return null;
                              }, 
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _validateAndRegister,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0D47A1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Registrar',
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            TextButton(
                              onPressed: () {
                                context.go('/login');
                              },
                              child: const Text(
                                '¿Ya tienes una cuenta? Inicia sesión',
                                style: TextStyle(color: Color(0xFFF6E78F7)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        );
  }

}