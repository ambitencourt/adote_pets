import '../../../pets/domain/repositories/login_repository_interface.dart';

abstract class ILogOutUsecase {
  Future call();
}

class LogOutUsecase implements ILogOutUsecase {
  final ILoginRepository loginRepository;

  LogOutUsecase({required this.loginRepository});

  @override
  Future call() async {
    await loginRepository.logOut();
  }
}
