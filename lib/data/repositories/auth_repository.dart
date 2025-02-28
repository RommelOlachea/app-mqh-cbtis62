import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/models.dart';

class AuthRepository {
  Future<int> registerUser(UserModel user) async {
    final db = await DatabaseHelper().database;

    // Verificar si el usuario ya existe
    final existingUser = await getUserByEmail(user.email);
    if (existingUser != null) {
      throw Exception('El usuario con el email ${user.email} ya existe.');
    }

    // Encriptar la contraseña antes de guardarla
    final hashedPassword = sha256.convert(utf8.encode(user.password)).toString();

    // Insertar el nuevo usuario
    return await db.insert(
      'usuarios',
      {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'password': hashedPassword,
        'token': user.token,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final db = await DatabaseHelper().database;

    final List<Map<String, dynamic>> maps = await db.query(
      'usuarios',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }
    return null;
  }
}
