import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../data/models/user_model.dart';
import '../data/repositories/auth_repository.dart';
import '../providers/auth_providers.dart';
import '../utils/utils.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, UserModel?>((ref) {
  return AuthController(ref.read(authRepositoryProvider));
});

class AuthController extends StateNotifier<UserModel?> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(null) {
    _loadUserFromStorage();
  }

  final Uuid _uuid = Uuid();

  Future<String> register(String name, String email, String password) async {
    final user = UserModel(
      id: _uuid.v4(), // Genera un ID único
      name: name,
      email: email,
      password: password,
      token: "", // El token se genera después de iniciar sesión
    );

    String result = await _authRepository.registerUser(user);

    return result;
  }

  Future<void> _loadUserFromStorage() async {
    final token = await SecureStorage.getToken();
    if (token != null) {
      // Simulación de usuario con token recuperado
      state = UserModel(
          id: "1",
          email: "test@example.com",
          name: "Test User",
          password: "algunpassword",
          token: token);
    }
  }

  // Future<bool> login(String email, String password) async {
  //   final user = await _repository.login(email, password);
  //   if (user != null) {
  //     state = user;
  //     await SecureStorage.saveToken(user.token);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future<UserModel?> login(String email, String password) async {
    UserModel? user = await _authRepository.getUserByEmail(email);

    if (user != null) {
      // Verificar si la contraseña coincide (hash)
      final hashedPassword = sha256.convert(utf8.encode(password)).toString();
      if (hashedPassword == user.password) {
        return user;
      }
    }
    return null;
  }

  Future<void> logout() async {
    state = null;
    await SecureStorage.deleteToken();
  }
}
