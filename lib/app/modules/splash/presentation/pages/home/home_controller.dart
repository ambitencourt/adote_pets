import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/usecases/verify_if_user_logged_usecase.dart';

class HomeController {
  final VerifyIfUserLoggedUsecase verifyIfUserLoggedUsecase;

  HomeController({
    required this.verifyIfUserLoggedUsecase,
  });
  init() async {
    await Future.delayed(const Duration(seconds: 4));
    final loggged = await verifyIfUserLoggedUsecase();

    if (loggged) {
      Modular.to.pushReplacementNamed('/pet');
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
  }
}
