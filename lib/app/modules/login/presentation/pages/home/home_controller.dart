import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/failures/validate_login_failure.dart';
import '../../../domain/usecases/validate_login_usecase.dart';

class HomeController {
  final emailController = TextEditingController();
  final IValidateLoginUsecase validateLogin;

  HomeController({
    required this.validateLogin,
  });

  onLoginButtonPressed() async {
    try {
      final login = LoginEntity(
        email: emailController.text,
      );
      var result = await validateLogin(login: login);

      if (result) {
        Modular.to.pushReplacementNamed('/pet');
      } else {
        AsukaSnackbar.warning("Email Invalido").show();
      }
    } on ValidateLoginFailure {
      AsukaSnackbar.warning("O Email não pode ser vazio").show();
    }
  }
}
