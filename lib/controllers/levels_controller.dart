import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqh_rommel/data/models/levels_model.dart';
import 'package:mqh_rommel/data/repositories/level_repository.dart';
import 'package:mqh_rommel/providers/levels_provider.dart';

final levelsControllerProvider =
    StateNotifierProvider<LevelsController, LevelsModel?>((ref) {
  return LevelsController(ref.read(levelsRepositoryProvider));
});

class LevelsController extends StateNotifier<LevelsModel?> {
  final LevelsRepository _levelsRepository;

  LevelsController(this._levelsRepository) : super(null);

  /// Recupera los niveles de un usuario y actualiza el estado.
  Future<LevelsModel?> fetchLevels(String userId) async {
    
    final levels = await _levelsRepository.getLevels(userId);
    state = levels;
    return levels;
  }

  /// Actualiza un nivel específico junto con su calificación.
  /// [levelNumber] indica el número de nivel a actualizar (1 a 9).
  /// [completion] debe ser 1 si el nivel se completó, 0 en caso contrario.
  Future<int> updateLevel(
    String userId,
    int levelNumber, {
    required bool completion,
    required double calification,
  }) async {

    await _levelsRepository.insertOrInitializeLevels(userId);

    final result = await _levelsRepository.updateLevel(
      userId,
      levelNumber,
      completion: completion,
      calification: calification,
    );
    // Se refresca el estado luego de la actualización.
    await fetchLevels(userId);
    return result;
  }

  Future<void> insertOrInitializeLevels(String userId) async {
    await _levelsRepository.insertOrInitializeLevels(userId);   
  }

  /// Verifica si un nivel específico está completado para un usuario.
  Future<bool> isLevelCompleted(String userId, int levelNumber) async {
    return await _levelsRepository.isLevelCompleted(userId, levelNumber);
  }
}
