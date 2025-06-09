class LevelsModel {
  final String userId;
  bool level1;
  double calification1;
  bool level2;
  double calification2;
  bool level3;
  double calification3;
  bool level4;
  double calification4;
  bool level5;
  double calification5;
  bool level6;
  double calification6;
  bool level7;
  double calification7;
  bool level8;
  double calification8;
  bool level9;
  double calification9;
  bool level10;
  double calification10;
  int completedLevels;

  LevelsModel({
    required this.userId,
    this.level1 = false,
    this.calification1 = 0.0,
    this.level2 = false,
    this.calification2 = 0.0,
    this.level3 = false,
    this.calification3 = 0.0,
    this.level4 = false,
    this.calification4 = 0.0,
    this.level5 = false,
    this.calification5 = 0.0,
    this.level6 = false,
    this.calification6 = 0.0,
    this.level7 = false,
    this.calification7 = 0.0,
    this.level8 = false,
    this.calification8 = 0.0,
    this.level9 = false,
    this.calification9 = 0.0,
    this.level10 = false,
    this.calification10 = 0.0,
    this.completedLevels = 0
  });

  // Convierte el objeto a un mapa para insertar o actualizar en la base de datos.
  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'level1': level1,
      'calification1': calification1,
      'level2': level2,
      'calification2': calification2,
      'level3': level3,
      'calification3': calification3,
      'level4': level4,
      'calification4': calification4,
      'level5': level5,
      'calification5': calification5,
      'level6': level6,
      'calification6': calification6,
      'level7': level7,
      'calification7': calification7,
      'level8': level8,
      'calification8': calification8,
      'level9': level9,
      'calification9': calification9,
      'level10': level10,
      'calification10': calification10,
      'completedLevels': completedLevels,
    };
  }

  // Crea una instancia de Levels a partir de un mapa obtenido de la base de datos.
  factory LevelsModel.fromMap(Map<String, dynamic> map) {
    return LevelsModel(
      userId: map['user_id'],
      level1: (map['level1'] ?? 0) == 1, // Convertir a bool
      calification1: (map['calification1'] ?? 0.0).toDouble(),
      level2: (map['level2'] ?? 0) == 1, // Convertir a bool
      calification2: (map['calification2'] ?? 0.0).toDouble(),
      level3: (map['level3'] ?? 0) == 1, // Convertir a bool
      calification3: (map['calification3'] ?? 0.0).toDouble(),
      level4: (map['level4'] ?? 0) == 1, // Convertir a bool
      calification4: (map['calification4'] ?? 0.0).toDouble(),
      level5: (map['level5'] ?? 0) == 1, // Convertir a bool
      calification5: (map['calification5'] ?? 0.0).toDouble(),
      level6: (map['level6'] ?? 0) == 1, // Convertir a bool
      calification6: (map['calification6'] ?? 0.0).toDouble(),
      level7: (map['level7'] ?? 0) == 1, // Convertir a bool
      calification7: (map['calification7'] ?? 0.0).toDouble(),
      level8: (map['level8'] ?? 0) == 1, // Convertir a bool
      calification8: (map['calification8'] ?? 0.0).toDouble(),
      level9: (map['level9'] ?? 0) == 1, // Convertir a bool
      calification9: (map['calification9'] ?? 0.0).toDouble(),
      level10: (map['level10'] ?? 0) == 1, // Convertir a bool
      calification10: (map['calification10'] ?? 0.0).toDouble(),
      completedLevels: map['completedLevels'] ?? 0,
    );
  }
}
