import 'package:flutter_modular/flutter_modular.dart';
import 'data/infra/repositories/login_repository.dart';
import 'domain/repositories/login_repository_interface.dart';
import 'domain/usecases/validate_login_usecase.dart';
import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/home/home_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(validateLogin: i())),
        Bind.factory<IValidateLoginUsecase>(
            (i) => ValidateLoginUsecase(loginRepository: i())),
        Bind.factory<ILoginRepository>(
            (i) => LoginRepository(loginDatasource: i())),
        Bind.factory<ILoginRepository>(
            (i) => LoginRepository(loginDatasource: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
