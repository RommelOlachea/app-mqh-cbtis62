import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'app_database.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        token TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE levels (
        user_id TEXT PRIMARY KEY,
        level1 INTEGER NOT NULL DEFAULT 0,
        calification1 REAL NOT NULL DEFAULT 0.0,
        level2 INTEGER NOT NULL DEFAULT 0,
        calification2 REAL NOT NULL DEFAULT 0.0,
        level3 INTEGER NOT NULL DEFAULT 0,
        calification3 REAL NOT NULL DEFAULT 0.0,
        level4 INTEGER NOT NULL DEFAULT 0,
        calification4 REAL NOT NULL DEFAULT 0.0,
        level5 INTEGER NOT NULL DEFAULT 0,
        calification5 REAL NOT NULL DEFAULT 0.0,
        level6 INTEGER NOT NULL DEFAULT 0,
        calification6 REAL NOT NULL DEFAULT 0.0,
        level7 INTEGER NOT NULL DEFAULT 0,
        calification7 REAL NOT NULL DEFAULT 0.0,
        level8 INTEGER NOT NULL DEFAULT 0,
        calification8 REAL NOT NULL DEFAULT 0.0,
        level9 INTEGER NOT NULL DEFAULT 0,
        calification9 REAL NOT NULL DEFAULT 0.0,
        FOREIGN KEY (user_id) REFERENCES usuarios(id)
      )
    ''');
  }
}
