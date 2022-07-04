import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'commons/adapters/http_client/dio/dio_adapter.dart';
import 'commons/adapters/http_client/http_client_adapter.dart';
import 'commons/data/datasources/login_datasource.dart';
import 'commons/data/infra/internal/datasources/login_datasource.dart';
import 'modules/login/login_module.dart';
import 'modules/pets/pet_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<ILoginDatasource>((i) => LoginDatasource()),
        Bind.factory((i) => Dio()),
        Bind.factory<IHttpClientAdapter>((i) => DioAdapter(dio: i())),
        AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/pet', module: PetModule()),
      ];
}
