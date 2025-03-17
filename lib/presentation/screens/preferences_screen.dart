import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mqh_rommel/controllers/auth_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class PreferencesScreen extends ConsumerStatefulWidget {
  const PreferencesScreen({super.key});

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends ConsumerState<PreferencesScreen> {
  String _version = 'Cargando...';
  String _versionInfo = '';
  String _rightsReserved = '';

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _rightsReserved =
          '© ${DateTime.now().year.toString()} CBTIS62. Derechos Reservados.';
      _version = "MQH Versión ${packageInfo.version}\n© ${DateTime.now().year.toString()} CBTIS62.";
      _versionInfo = packageInfo.version;
    });
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[900]!, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Separa arriba y abajo
          children: <Widget>[
            const SizedBox(height: 70),
            // Contenido en la parte superior con botón de retroceso
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen de configuración con bordes redondeados y texto
                  Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Image.asset(
                            'assets/social/lince.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _version,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
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
                    const Text(
                      'Redes Sociales',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL(
                              'https://www.facebook.com/cbtis062oficial/photos?locale=es_LA'),
                          child: Image.asset(
                            'assets/social/facebook3.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () => _launchURL('https://cbtis62.edu.mx/'),
                          child: Image.asset(
                            'assets/social/web6.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // const SizedBox(width: 15),
                        // GestureDetector(
                        //   // onTap: () => _launchURL('https://tiktok.com/@tuCuenta'),
                        //   onTap: () => _launchURL('https://tiktok.com'),
                        //   child: Image.asset(
                        //     'assets/social/tiktok1.png',
                        //     width: 50,
                        //     height: 50,
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0D47A1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                      onPressed: () {
                        context.push('/profile');
                      },
                      child: const Text('Editar Perfil', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
            // Lista alineada abajo con Padding inferior
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20), // Espacio en la parte inferior
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/about/politica1.png',
                      width: 25,
                      height: 25,
                    ),
                    title: const Text(
                      "Politica de privacidad",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      context.push('/privacypolicy');
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/about/terminos.png',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text(
                      "Terminos de uso",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      context.push('/termsofuse');
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/about/license3.png',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text(
                      "Licencias",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      showLicensePage(
                        context: context,
                        applicationName: 'MQH',
                        applicationVersion: _versionInfo,
                        applicationLegalese: _rightsReserved,
                      );
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/about/contacto.png',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text(
                      "Contactanos",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      context.push('/contact');
                    },
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/about/cerrar.png',
                      width: 24,
                      height: 24,
                    ),
                    title: const Text(
                      "Cerrar Sesión",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      final authController =
                          ref.read(authControllerProvider.notifier);
                      authController.logout();
                      context.go('/login');
                    },
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
