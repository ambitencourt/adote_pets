import 'package:adote_pets/app/modules/login/domain/entities/login_entity.dart';

abstract class ILoginRepository {
  Future<bool> validateLogin({required LoginEntity login});
}
