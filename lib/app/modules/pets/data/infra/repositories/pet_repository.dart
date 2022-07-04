import 'package:adote_pets/app/modules/pets/data/infra/datasources/pet_datasource_interface.dart';
import 'package:adote_pets/app/modules/pets/domain/entities/pet_entity.dart';
import 'package:adote_pets/app/modules/pets/domain/repositories/pets_repository_interface.dart';

class PetRepository implements IPetRepository {
  final IPetDatasource datasource;

  PetRepository({required this.datasource});

  @override
  Future<List<PetEntity>> getPets() async {
    final result = <PetEntity>[];

    final cats = await datasource.getCat();
    final dogs = await datasource.getDog();
    if (cats.isNotEmpty) result.addAll(cats);
    if (dogs.isNotEmpty) result.addAll(dogs);
    result.sort(
      ((a, b) => a.name.toString().compareTo(
            b.name.toString(),
          )),
    );
    return result;
  }
}
