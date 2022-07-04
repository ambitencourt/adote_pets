import 'package:adote_pets/app/commons/resources/app_colors__resources.dart';
import 'package:flutter/material.dart';

import '../../../../../../commons/resources/app_text_styles_resources.dart';
import '../../../../domain/enum/pet_enum.dart';

class OptionWidget extends StatelessWidget {
  final ValueChanged<int?> onChanged;
  final int groupValue;
  final int value;
  const OptionWidget({
    super.key,
    required this.onChanged,
    required this.groupValue,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final image = value == 0
        ? EnumPetType.all.image
        : value == 1
            ? EnumPetType.cat.image
            : EnumPetType.dog.image;
    final title = value == 0
        ? EnumPetType.all.description
        : value == 1
            ? EnumPetType.cat.description
            : EnumPetType.dog.description;

    return Row(
      children: [
        // Radio<int>(
        //   value: value,
        //   onChanged: onChanged,
        //   groupValue: groupValue,
        // ),
        // Text(title)

        Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                onChanged(value);
                groupValue == value;
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(115, 36),
                primary:
                    value == groupValue ? AppColors.primary : AppColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    image,
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    title,
                    style: getpoppins16(
                      fontSize: 11,
                      color: value == groupValue
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
