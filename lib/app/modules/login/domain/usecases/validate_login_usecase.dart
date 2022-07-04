import '../entities/login_entity.dart';
import '../failures/validate_login_failure.dart';
import '../repositories/login_repository_interface.dart';

abstract class IValidateLoginUsecase {
  Future<bool> call({required LoginEntity login});
}

class ValidateLoginUsecase implements IValidateLoginUsecase {
  final ILoginRepository loginRepository;

  ValidateLoginUsecase({
    required this.loginRepository,
  });

  @override
  Future<bool> call({required LoginEntity login}) async {
    if (!login.validate()) throw ValidateLoginFailure('Login Invalido');

    return await loginRepository.validateLogin(login: login);
  }
}
