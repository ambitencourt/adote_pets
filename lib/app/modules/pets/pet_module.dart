import 'package:flutter_modular/flutter_modular.dart';
import 'data/datasources/external/pet_datasource.dart';
import 'data/infra/datasources/pet_datasource_interface.dart';
import 'data/infra/repositories/pet_repository.dart';
import 'domain/repositories/pets_repository_interface.dart';
import 'domain/usecases/get_pets_usecase.dart';
import 'presentation/pages/details/details_page.dart';
import 'presentation/pages/home/filter_store.dart';
import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/home/home_store.dart';

class PetModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => FilterStore()),
        Bind.lazySingleton((i) => HomeStore()),
        Bind.factory((i) => HomeController(
              getPets: i(),
              store: i(),
              filterStore: i(),
            )),
        Bind.factory<IGetPetsUsecase>((i) => GetPetsUsecase(repository: i())),
        Bind.factory<IPetRepository>((i) => PetRepository(datasource: i())),
        Bind.factory<IPetDatasource>((i) => PetDatasource(client: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/details',
            child: (context, args) => DetailsPage(
                  pet: args.data,
                )),
      ];
}
