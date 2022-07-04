import 'package:flutter/material.dart';

import '../../../domain/entities/pet_entity.dart';
import '../../../domain/enum/pet_enum.dart';
import 'view_model/home_view_model.dart';

class HomeStore extends ValueNotifier<HomeViewModel> {
  HomeStore() : super(HomeViewModel(listFiltered: [], snapshot: []));

  setSnapshot(List<PetEntity> list) =>
      value = HomeViewModel(listFiltered: list, snapshot: list);

  filter(int option) {
    if (option == EnumPetType.all.type) {
      value = value.copyWith(listFiltered: value.snapshot);
    } else {
      value = value.copyWith(
          listFiltered:
              value.snapshot.where((e) => e.type.type == option).toList());
    }
  }
}
