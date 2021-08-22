import 'dart:convert';

class AuthModel {
  final String email;
  final String password;
  AuthModel(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      map['email'],
      map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source));

  AuthModel copyWith({
    String? email,
    String? password,
  }) {
    return AuthModel(
      email ?? this.email,
      password ?? this.password,
    );
  }
}
