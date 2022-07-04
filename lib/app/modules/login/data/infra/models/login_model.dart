import 'dart:convert';

import 'package:adote_pets/app/modules/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source));
}
