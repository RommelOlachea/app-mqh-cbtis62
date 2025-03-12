import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Política de Privacidad'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Política de Privacidad de la Aplicación MQH',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            const Text(
              'Última actualización: [03/2025]',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            buildJustifiedText('', 
              'La aplicación MQH es un prototipo desarrollado por alumnos de educación media superior con el propósito de enseñar Lengua de Señas Mexicana (LSM). Nos comprometemos a respetar la privacidad de nuestros usuarios y proteger su información personal. Esta Política de Privacidad explica qué datos recopilamos y cómo los utilizamos.'
            ),
            buildJustifiedText('1. Información que Recopilamos\n\n',
              'Para el funcionamiento de la aplicación, recopilamos únicamente la siguiente información:\n\n'
              '- Correo electrónico.\n'
              '- Nombre de usuario.\n\n'
              'Estos datos son utilizados exclusivamente para la autenticación en la aplicación y no para fines comerciales o publicitarios.'
            ),
            buildJustifiedText('2. Uso de la Información\n\n',
              'La información recopilada se utiliza únicamente para:\n\n'
              '- Permitir el acceso a la aplicación.\n'
              '- Mantener una cuenta de usuario para registrar su progreso en el aprendizaje de LSM.'
            ),
            buildJustifiedText('3. Compartición de la Información\n\n',
              'No compartimos la información personal con terceros bajo ninguna circunstancia. La información es utilizada exclusivamente dentro del prototipo educativo para mejorar la experiencia de aprendizaje.'
            ),
            buildJustifiedText('4. Seguridad de la Información\n\n',
              'Implementamos medidas adecuadas para proteger los datos almacenados en la aplicación y prevenir accesos no autorizados. No obstante, al tratarse de un prototipo educativo, se recomienda que los usuarios no utilicen datos sensibles en la aplicación.'
            ),
            buildJustifiedText('5. Retención de Datos\n\n',
              'Los datos se almacenarán únicamente mientras el usuario utilice la aplicación. Si un usuario decide eliminar su cuenta, todos sus datos serán eliminados permanentemente.'
            ),
            buildJustifiedText('6. Derechos del Usuario\n\n',
              'Como usuario, tienes derecho a:\n\n'
              '- Acceder a tus datos almacenados.\n'
              '- Solicitar la eliminación de tu cuenta y datos personales.\n\n'
              'Para ejercer estos derechos, puedes contactarnos a través del correo de soporte indicado en la aplicación.'
            ),
            buildJustifiedText('7. Modificaciones a la Política de Privacidad\n\n',
              'Nos reservamos el derecho de modificar esta Política de Privacidad en cualquier momento. Cualquier cambio será comunicado a los usuarios dentro de la aplicación.'
            ),
            buildJustifiedText('8. Contacto\n\n',
              'Si tienes preguntas o inquietudes sobre esta Política de Privacidad, puedes contactarnos a través del correo de soporte proporcionado en la aplicación.'
            ),
          ],
        ),
      ),
    );
  }

  Widget buildJustifiedText(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        Text(
          content,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
