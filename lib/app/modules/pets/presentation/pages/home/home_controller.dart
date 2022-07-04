import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/usecases/get_pets_usecase.dart';
import 'filter_store.dart';
import 'home_store.dart';

class HomeController {
  final IGetPetsUsecase getPets;
  final HomeStore store;
  final FilterStore filterStore;

  HomeController({
    required this.getPets,
    required this.store,
    required this.filterStore,
  }) {
    init();
  }

  init() async {
    final pets = await getPets.call();

    store.setSnapshot(pets);
  }

  changeType(int? value) {
    filterStore.setFilter(value ?? 0);

    store.filter(filterStore.value);
  }

  logout() {
    Modular.to.popAndPushNamed('/login');
  }
}
