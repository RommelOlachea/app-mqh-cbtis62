import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String lincesKey =
      dotenv.env['LINCES_KEY'] ?? 'No hay API KEY';
}