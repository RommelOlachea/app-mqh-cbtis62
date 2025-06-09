import 'package:sqflite/sqflite.dart';
import '../database/database_helper.dart';
import '../models/levels_model.dart';

class LevelsRepository {
  /// Recupera el registro de niveles de un usuario.
  Future<LevelsModel?> getLevels(String userId) async {
    final db = await DatabaseHelper().database;
    final List<Map<String, dynamic>> maps = await db.query(
      'levels',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    if (maps.isNotEmpty) {
      return LevelsModel.fromMap(maps.first);
    }
    return null;
  }

  /// Actualiza un nivel específico para un usuario, incluyendo su calificación.
  ///
  /// [levelNumber] es el número del nivel a actualizar (1, 2, ..., 9).
  /// [completion] debe ser 1 si el nivel fue completado o 0 en caso contrario.
  /// [calification] es la calificación obtenida en ese nivel.
Future<int> updateLevel(
  String userId,
  int levelNumber, {
  required bool completion,
  required double calification,
}) async {
  final db = await DatabaseHelper().database;
  final String levelColumn = 'level$levelNumber';
  final String calificationColumn = 'calification$levelNumber';

  // 1) Recupera el registro actual de niveles
  final maps = await db.query(
    'levels',
    where: 'user_id = ?',
    whereArgs: [userId],
  );
  if (maps.isEmpty) {
    // No existe aún, podrías lanzar o inicializar aquí
    throw Exception('No existe registro de niveles para $userId');
  }
  final current = maps.first;

  // 2) Suma todas las calificaciones hasta levelNumber,
  //    usando la nueva calificación para el nivel que estás actualizando
  double totalCalif = 0.0;
  for (var i = 1; i <= levelNumber; i++) {
    if (i == levelNumber) {
      totalCalif += calification;
    } else {
      // Asegúrate de castear a double
      totalCalif += (current['calification$i'] as num).toDouble();
    }
  }

  // 3) Calcula el promedio
  final double experience = totalCalif / levelNumber;

  // 4) Arma el mapa de actualización incluyendo experience
  final updateMap = <String, dynamic>{
    levelColumn: completion ? 1 : 0,
    calificationColumn: calification,
    'completedLevels': levelNumber,
    'experience': experience,
  };

  // 5) Ejecuta el update
  return await db.update(
    'levels',
    updateMap,
    where: 'user_id = ?',
    whereArgs: [userId],
  );
}


  /// Verifica si un nivel específico está completado para un usuario.
  ///
  /// Se asume que si el valor del nivel es 1, entonces se considera completado.
  Future<bool> isLevelCompleted(String userId, int levelNumber) async {
    final db = await DatabaseHelper().database;
    final String levelColumn = 'level$levelNumber';

    final List<Map<String, dynamic>> maps = await db.query(
      'levels',
      columns: [levelColumn],
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    if (maps.isNotEmpty) {
      return maps.first[levelColumn] == 1;
    }
    return false;
  }

/// Inserta un nuevo registro de niveles para un usuario si no existe.
  Future<void> insertOrInitializeLevels(String userId) async {
    final db = await DatabaseHelper().database;

    // Verificar si el usuario ya tiene un registro en 'levels'
    final List<Map<String, dynamic>> existingRecords = await db.query(
      'levels',
      where: 'user_id = ?',
      whereArgs: [userId],
    );

    if (existingRecords.isEmpty) {
      // Crear un mapa con los valores por defecto
      Map<String, dynamic> newUserLevels = {
        'user_id': userId,
        'level1': false, 'calification1': 0.0,
        'level2': false, 'calification2': 0.0,
        'level3': false, 'calification3': 0.0,
        'level4': false, 'calification4': 0.0,
        'level5': false, 'calification5': 0.0,
        'level6': false, 'calification6': 0.0,
        'level7': false, 'calification7': 0.0,
        'level8': false, 'calification8': 0.0,
        'level9': false, 'calification9': 0.0,
        'level10': false, 'calification10': 0.0,
        'completedLevels': 0,
        'experience': 0.0, 
      };

      // Insertar el registro en la base de datos
      await db.insert('levels', newUserLevels);
    }
  }


}
