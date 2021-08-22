import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String id;

  UserModel(this.name, this.email, this.id);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'],
      map['email'],
      map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
