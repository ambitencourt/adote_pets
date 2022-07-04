import '../../../modules/login/data/infra/models/login_model.dart';

abstract class ILoginDatasource {
  Future<LoginModel?> login({required String email});
  Future saveLogin({required String email});
  Future<String?> getLogin();
  Future<void> clear();
}
