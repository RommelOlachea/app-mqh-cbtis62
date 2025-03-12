import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listas de correos para cada categoría
    final List<String> soporteTecnico = [
      'jmaguilarm22@cbtis62.edu.mx',
      'spelayom22@cbtis62.edu.mx'
    ];
    final List<String> contactoGeneral = [
      'cosalasz22@cbtis62.edu.mx',
      'lomarquezd22@cbtis62.edu.mx'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacto"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Soporte",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Si tienes alguna duda o inconveniente con la aplicación, por favor, contacta a nuestro equipo de soporte a través de los siguientes correos electrónicos:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text("Contacto General"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: contactoGeneral
                      .map((email) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(email),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text("Soporte Técnico"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: soporteTecnico
                      .map((email) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(email),
                          ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: Image.asset(
                'assets/about/contact.png',
                width: 90,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
