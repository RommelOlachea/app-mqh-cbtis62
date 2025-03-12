import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Términos de Uso'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Términos de Uso de la Aplicación MQH',
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
            buildJustifiedText(
              '',
              'Bienvenido a la aplicación MQH. Estos Términos de Uso regulan el uso de nuestra aplicación, la cual ha sido desarrollada como un prototipo por estudiantes del CBTIS62 para enseñar lenguaje de señas a alumnos de educación media superior. Al descargar, acceder o utilizar nuestra aplicación, aceptas estos términos en su totalidad. Si no estás de acuerdo, por favor no utilices la aplicación.'
            ),
            buildJustifiedText(
              '1. Descripción del Servicio\n\n',
              'MQH es una aplicación móvil educativa que ofrece a los estudiantes de educación media superior módulos interactivos, videos y ejercicios prácticos para aprender lenguaje de señas de manera dinámica y accesible.'
            ),
            buildJustifiedText(
              '2. Uso de la Aplicación\n\n',
              'La aplicación MQH está destinada exclusivamente para fines educativos. Al utilizar la aplicación, te comprometes a seguir las directrices establecidas y a hacer un uso responsable de los contenidos ofrecidos.'
            ),
            buildJustifiedText(
              '3. Registro y Acceso\n\n',
              'Para acceder a ciertas funcionalidades, es posible que debas registrarte. Es fundamental que proporciones información veraz y mantengas la confidencialidad de tus credenciales de acceso.'
            ),
            buildJustifiedText(
              '4. Contenido Educativo\n\n',
              'Todos los contenidos, lecciones y ejercicios de MQH han sido diseñados con fines educativos. Queda prohibida la reproducción, distribución o modificación de cualquier material sin autorización expresa.'
            ),
            buildJustifiedText(
              '5. Recopilación y Uso de Datos\n\n',
              'La aplicación puede recopilar datos personales y de uso para mejorar la experiencia del usuario y personalizar el contenido. La gestión de estos datos se realiza conforme a nuestra Política de Privacidad.'
            ),
            buildJustifiedText(
              '6. Restricciones\n\n',
              'Está prohibido modificar, descompilar o reproducir cualquier parte de la aplicación. Además, se prohíbe el uso de MQH para fines distintos a los educativos o comerciales sin autorización.'
            ),
            buildJustifiedText(
              '7. Modificaciones al Servicio\n\n',
              'Nos reservamos el derecho de modificar o descontinuar la aplicación en cualquier momento, sin responsabilidad por las interrupciones o cambios que se puedan producir.'
            ),
            buildJustifiedText(
              '8. Propiedad Intelectual\n\n',
              'Todos los derechos de propiedad intelectual relacionados con MQH son propiedad de sus creadores. Queda prohibida la copia, distribución o modificación de la aplicación sin el consentimiento previo y por escrito.'
            ),
            buildJustifiedText(
              '9. Limitación de Responsabilidad\n\n',
              'MQH se proporciona “tal cual” y no garantizamos que su uso sea ininterrumpido o libre de errores. El uso de la aplicación es bajo tu propio riesgo.'
            ),
            buildJustifiedText(
              '10. Enlaces a Terceros\n\n',
              'La aplicación puede incluir enlaces a sitios web de terceros. No nos hacemos responsables del contenido o las políticas de privacidad de dichos sitios.'
            ),
            buildJustifiedText(
              '11. Cambios en los Términos de Uso\n\n',
              'Podemos actualizar estos Términos de Uso en cualquier momento. Es tu responsabilidad revisarlos periódicamente para estar al tanto de cualquier modificación.'
            ),
            buildJustifiedText(
              '12. Contacto\n\n',
              'Si tienes alguna pregunta o comentario sobre estos Términos de Uso, por favor contáctanos a: cbtis62@cbtis62.edu.mx.'
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
