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
    required int completion,
    required double calification,
  }) async {
    final db = await DatabaseHelper().database;
    // Construir dinámicamente el nombre de las columnas según el nivel.
    final String levelColumn = 'level$levelNumber';
    final String calificationColumn = 'calification$levelNumber';

    // Mapa con los valores actualizados.
    Map<String, dynamic> updateMap = {
      levelColumn: completion,
      calificationColumn: calification,
    };

    // Actualizar el registro correspondiente al usuario.
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
}
