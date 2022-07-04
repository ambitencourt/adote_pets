class LoginEntity {
  String email;
  LoginEntity({required this.email});

  bool validate() => email.isNotEmpty;
}
