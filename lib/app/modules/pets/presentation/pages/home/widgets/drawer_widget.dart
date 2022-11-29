import 'package:adote_pets/app/commons/resources/app_colors__resources.dart';
import 'package:adote_pets/app/commons/resources/app_text_styles_resources.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.blueGrey,
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .1,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .5,
          height: MediaQuery.of(context).size.height * .8,
          color: AppColors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.pets_outlined,
                ),
                label: Text(
                  'Sobre',
                  style: getPoppins20(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
