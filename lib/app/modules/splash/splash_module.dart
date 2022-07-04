import 'package:flutter_modular/flutter_modular.dart';

import 'data/infra/repositories/login_repository.dart';
import 'domain/repositories/login_repository_interface.dart';
import 'domain/usecases/verify_if_user_logged_usecase.dart';
import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/home/home_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
            (i) => HomeController(verifyIfUserLoggedUsecase: i())),
        Bind.lazySingleton(
            (i) => VerifyIfUserLoggedUsecase(loginRepository: i())),
        Bind.lazySingleton<ILoginRepository>(
            (i) => LoginRepository(loginDatasource: i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
