class UtilsApp {
  
  static String cleanEmailUsername(String email) {
    // Separar la parte antes del @
    String name = email.split('@').first;

    // Remover puntos (.) y guiones (-)
    name = name.replaceAll(RegExp(r'[.-]'), '');

    return name;
  }



  
}
