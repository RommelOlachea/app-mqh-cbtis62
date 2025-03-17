import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:mqh_rommel/presentation/widgets/user_avatar_image.dart';
import 'package:mqh_rommel/utils/utils_app.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    // Se obtiene el usuario actual para inicializar el campo del nombre.
    final user = ref.read(authControllerProvider)!;
    _nameController = TextEditingController(text: user.name);
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String imageProfile =
        UtilsApp.cleanEmailUsername(ref.watch(authControllerProvider)!.email);
    String username = ref.watch(authControllerProvider)!.name;
    String email = ref.read(authControllerProvider)!.email;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Sección superior con la foto de perfil, degradado invertido y bordes redondeados
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.blue[900]!],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 70),
                          Container(
                            width: 180,
                            height: 180,
                            child: Stack(
                              children: [
                                Center(
                                  child: UserAvatarImage(
                                    imageProfile: imageProfile,
                                    radius: 90,
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Redirige a la pantalla para cambiar la foto de perfil
                                      context.push('/profilephoto');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.white54,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        size: 26,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                    email,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  ],
                ),
              ),
            ),
            // Sección inferior que muestra el nombre del usuario
SizedBox(height: 30,),
            // Formulario para actualizar datos (omitiendo el campo de correo electrónico)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Campo para actualizar el nombre
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "Nombre",
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingrese su nombre";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Campo para actualizar la contraseña
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: "Contraseña",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          obscureText: !_passwordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Ingrese su contraseña";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // Campo para confirmar la contraseña
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: "Confirmar Contraseña",
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _confirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _confirmPasswordVisible =
                                      !_confirmPasswordVisible;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          obscureText: !_confirmPasswordVisible,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Confirme su contraseña";
                            }
                            if (value != _passwordController.text) {
                              return "Las contraseñas no coinciden";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 50),
                        // Botón para actualizar los datos del usuario
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0D47A1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () async{
                            if (_formKey.currentState!.validate()) {
                              // Se invoca el método updateUser del authControllerProvider
                              final result = await ref
                                  .read(authControllerProvider.notifier)
                                  .updateUser(
                                    _nameController.text,
                                    _passwordController.text,
                                  );
                              // Se muestra un Snackbar con el mensaje de resultado
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(result)),
                              );
                            }
                          },
                          child: const Text("Actualizar Datos", style: TextStyle(color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
