import '../../../domain/entities/pet_entity.dart';
import '../../../domain/enum/pet_enum.dart';

class PetModel extends PetEntity {
  PetModel({
    required super.type,
    required super.name,
    required super.description,
    required super.id,
    required super.image,
    required super.origin,
    required super.temperament,
  });

  factory PetModel.fromMap(Map<String, dynamic> map, EnumPetType type) {
    return PetModel(
      type: type,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      id: map['id']?.toString() ?? '',
      image: map['image']?['url'] ?? '',
      origin: map['origin'] ?? '',
      temperament: map['temperament'] ?? '',
    );
  }
}
