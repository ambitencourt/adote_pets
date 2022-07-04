import 'package:adote_pets/app/modules/pets/data/infra/models/pet_model.dart';

abstract class IPetDatasource {
  Future<List<PetModel>> getCat();
  Future<List<PetModel>> getDog();
}
