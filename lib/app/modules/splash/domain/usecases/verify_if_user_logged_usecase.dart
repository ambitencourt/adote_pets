import '../repositories/login_repository_interface.dart';

abstract class IVerifyIfUserLoggedUsecase {
  Future<bool> call();
}

class VerifyIfUserLoggedUsecase implements IVerifyIfUserLoggedUsecase {
  final ILoginRepository loginRepository;
  VerifyIfUserLoggedUsecase({required this.loginRepository});

  @override
  Future<bool> call() async {
    final result = await loginRepository.getLoggedUser();

    return result?.isNotEmpty ?? false;
  }
}
