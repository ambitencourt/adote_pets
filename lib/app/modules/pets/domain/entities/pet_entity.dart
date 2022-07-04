import 'package:adote_pets/app/modules/pets/domain/enum/pet_enum.dart';

class PetEntity {
  final EnumPetType type;
  final String name;
  final String description;
  final String id;
  final String image;
  final String origin;
  final String temperament;

  PetEntity({
    required this.type,
    required this.name,
    required this.description,
    required this.id,
    required this.image,
    required this.origin,
    required this.temperament,
  });
}
