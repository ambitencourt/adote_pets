import 'package:adote_pets/app/modules/pets/data/infra/models/pet_model.dart';

import '../../../../../commons/adapters/http_client/http_client_adapter.dart';
import '../../../../../commons/default_errors.dart';
import '../../../domain/enum/pet_enum.dart';
import '../../infra/datasources/pet_datasource_interface.dart';

class PetDatasource implements IPetDatasource {
  final IHttpClientAdapter client;

  PetDatasource({required this.client});
  @override
  Future<List<PetModel>> getCat() async {
    try {
      var response = await client.get(
        'https://api.thecatapi.com/v1/breeds',
        headers: {'x-api-key': '01abe253-8038-4d1a-8107-18ccf8d832b0'},
      );

      final result = (response.data as List)
          .map((e) => PetModel.fromMap(e, EnumPetType.cat))
          .toList();
      return result;
    } catch (e) {
      throw DatasourceError(
        message: 'Erro ao tentar buscar dados externos',
      );
    }
  }

  @override
  Future<List<PetModel>> getDog() async {
    try {
      var response = await client.get(
        'https://api.thedogapi.com/v1/breeds',
        headers: {'x-api-key': '01abe253-8038-4d1a-8107-18ccf8d832b0'},
      );

      final result = (response.data as List)
          .map((e) => PetModel.fromMap(e, EnumPetType.dog))
          .toList();
      return result;
    } catch (e) {
      throw DatasourceError(
        message: 'Erro ao tentar buscar dados externos',
      );
    }
  }
}
