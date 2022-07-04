import 'package:adote_pets/app/modules/pets/domain/entities/pet_entity.dart';

import '../repositories/pets_repository_interface.dart';

abstract class IGetPetsUsecase {
  Future<List<PetEntity>> call();
}

class GetPetsUsecase implements IGetPetsUsecase {
  final IPetRepository repository;

  GetPetsUsecase({required this.repository});

  @override
  Future<List<PetEntity>> call() {
    return repository.getPets();
  }
}
