import 'package:adote_pets/app/commons/resources/app_images_resources.dart';

enum EnumPetType {
  all('Todos', 0, AppImages.paw),
  dog('Cachorro', 2, AppImages.icondog),
  cat('Gato', 1, AppImages.iconcat);

  const EnumPetType(
    this.description,
    this.type,
    this.image,
  );

  final String description;
  final int type;
  final String image;
}
