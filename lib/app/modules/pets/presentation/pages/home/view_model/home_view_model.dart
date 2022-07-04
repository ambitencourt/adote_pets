import '../../../../domain/entities/pet_entity.dart';

class HomeViewModel {
  final List<PetEntity> snapshot;
  final List<PetEntity> listFiltered;

  HomeViewModel({
    required this.snapshot,
    required this.listFiltered,
  });

  HomeViewModel copyWith({
    List<PetEntity>? snapshot,
    List<PetEntity>? listFiltered,
  }) {
    return HomeViewModel(
      snapshot: snapshot ?? this.snapshot,
      listFiltered: listFiltered ?? this.listFiltered,
    );
  }
}
