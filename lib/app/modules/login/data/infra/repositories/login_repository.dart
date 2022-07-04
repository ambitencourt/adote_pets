import 'package:adote_pets/app/modules/login/domain/repositories/login_repository_interface.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../../../commons/data/datasources/login_datasource.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  LoginRepository({
    required this.loginDatasource,
  });

  @override
  Future<bool> validateLogin({required LoginEntity login}) async {
    final result = await loginDatasource.login(email: login.email);

    if (result != null) {
      await loginDatasource.saveLogin(email: result.email);
    }
    return result != null;
  }
}
