class LevelsModel {
  final String userId;
  int level1;
  double calification1;
  int level2;
  double calification2;
  int level3;
  double calification3;
  int level4;
  double calification4;
  int level5;
  double calification5;
  int level6;
  double calification6;
  int level7;
  double calification7;
  int level8;
  double calification8;
  int level9;
  double calification9;

  LevelsModel({
    required this.userId,
    this.level1 = 0,
    this.calification1 = 0.0,
    this.level2 = 0,
    this.calification2 = 0.0,
    this.level3 = 0,
    this.calification3 = 0.0,
    this.level4 = 0,
    this.calification4 = 0.0,
    this.level5 = 0,
    this.calification5 = 0.0,
    this.level6 = 0,
    this.calification6 = 0.0,
    this.level7 = 0,
    this.calification7 = 0.0,
    this.level8 = 0,
    this.calification8 = 0.0,
    this.level9 = 0,
    this.calification9 = 0.0,
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
    };
  }

  // Crea una instancia de Levels a partir de un mapa obtenido de la base de datos.
  factory LevelsModel.fromMap(Map<String, dynamic> map) {
    return LevelsModel(
      userId: map['user_id'],
      level1: map['level1'] ?? 0,
      calification1: (map['calification1'] ?? 0.0).toDouble(),
      level2: map['level2'] ?? 0,
      calification2: (map['calification2'] ?? 0.0).toDouble(),
      level3: map['level3'] ?? 0,
      calification3: (map['calification3'] ?? 0.0).toDouble(),
      level4: map['level4'] ?? 0,
      calification4: (map['calification4'] ?? 0.0).toDouble(),
      level5: map['level5'] ?? 0,
      calification5: (map['calification5'] ?? 0.0).toDouble(),
      level6: map['level6'] ?? 0,
      calification6: (map['calification6'] ?? 0.0).toDouble(),
      level7: map['level7'] ?? 0,
      calification7: (map['calification7'] ?? 0.0).toDouble(),
      level8: map['level8'] ?? 0,
      calification8: (map['calification8'] ?? 0.0).toDouble(),
      level9: map['level9'] ?? 0,
      calification9: (map['calification9'] ?? 0.0).toDouble(),
    );
  }
}
