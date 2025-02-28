class UserModel {
  final String id;
  final String email;
  final String name;
  final String password;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.token,
  });

  // Convierte un objeto UserModel a Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'password': password, // Hash de contraseña (debe ser hasheado antes de guardar)
      'token': token,
    };
  }

  // Convierte un Map de SQLite a un objeto UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      password: map['password'],
      token: map['token'],
    );
  }
}
