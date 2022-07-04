import '../../../../../commons/data/datasources/login_datasource.dart';
import '../../../domain/repositories/login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource loginDatasource;

  LoginRepository({required this.loginDatasource});
  @override
  Future<String?> getLoggedUser() async {
    return await loginDatasource.getLogin();
  }
}
