import '../entities/pet_entity.dart';

abstract class IPetRepository {
  Future<List<PetEntity>> getPets();
}
