import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mqh_rommel/constants/enviroment.dart';
import 'package:mqh_rommel/data/models/models.dart';
import 'package:mqh_rommel/data/repositories/auth_repository.dart'
    show AuthRepository;
import 'package:mqh_rommel/providers/auth_providers.dart';
import 'package:mqh_rommel/utils/secure_storage.dart' show SecureStorage;
import 'package:uuid/uuid.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, UserModel?>((ref) {
  return AuthController(ref.read(authRepositoryProvider));
});

class AuthController extends StateNotifier<UserModel?> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(null) {
    //_loadUserFromStorage();
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

  Future<String> loginUserFromStorage() async {
    try {
      final token = await SecureStorage.getToken();
      if (token != null) {
        final jwt = JWT.verify(token, SecretKey(Enviroment.lincesKey));
        final user = UserModel(
          id: jwt.payload['sub'],
          name: jwt.payload['name'],
          email: jwt.payload['email'],
          password: '',
          token: token,
        );
        state = user; //cargamos la imagen del perfil en caso de existir.
        return 'correcto';
      }
      return 'incorrecto';
    } catch (e) {
      return 'incorrecto';
    }
  }

  Future<UserModel?> login(String email, String password) async {
    UserModel? user = await _authRepository.getUserByEmail(email);

    if (user != null) {
      // Verificar si la contraseña coincide (hash)
      final hashedPassword = sha256.convert(utf8.encode(password)).toString();
      if (hashedPassword == user.password) {
        final jwt = JWT({
          'sub': user.id, // Sujeto - identificador del sujeto del token
          'iat': DateTime.now().millisecondsSinceEpoch ~/
              1000, // Tiempo de emisión
          'exp': (DateTime.now()
                  .add(const Duration(hours: 1))
                  .millisecondsSinceEpoch ~/
              1000), // Expiración
          'iss': 'cbtis62.com', // Emisor - Identificador del emisor del token
          'aud':
              'mqh.rommel.olachea.alumnonocbtis62', // Audiencia - Identificador de la audiencia del token
          'name': user.name,
          'email': user.email
        });

        final token = jwt.sign(SecretKey(Enviroment.lincesKey));
        user.token = token;

        state = user;
        return user;
      }
    }
    return null;
  }

  Future<void> logout() async {
    //state = null;
    await SecureStorage.deleteToken();
    await SecureStorage.setRememberMe(false);
  }

  Future<void> forceUpdate() async {
    // Reasigna el mismo estado para que Riverpod lo detecte como un "cambio"
    state = state?.copyWith() ?? state;
  }

  // Nuevo método para actualizar el usuario (solo nombre y contraseña)
  Future<String> updateUser(String newName, String newPassword) async {
    if (state == null) return "No hay usuario logueado";

    // Se crea un nuevo modelo de usuario con los datos actualizados.
    final updatedUser = state!.copyWith(
      name: newName,
      password: newPassword,
    );

    final result = await _authRepository.updateUser(updatedUser);

    // Si la actualización fue exitosa, se actualiza el estado.
    if (result == 'Actualización exitosa') {
      state = updatedUser;
    }

    return result;
  }


}
