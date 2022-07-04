import 'package:adote_pets/app/commons/resources/app_colors__resources.dart';
import 'package:adote_pets/app/commons/resources/app_text_styles_resources.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../commons/resources/app_images_resources.dart';
import '../../../domain/entities/pet_entity.dart';
import '../home/home_controller.dart';

class DetailsPage extends StatefulWidget {
  final PetEntity pet;
  const DetailsPage({
    super.key,
    required this.pet,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pet.name),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: GridTile(
                  child: FancyShimmerImage(
                    imageUrl: widget.pet.image,
                    width: mediaQuery.width,
                    height: mediaQuery.height * .65,
                    boxFit: BoxFit.fill,
                    errorWidget: controller.filterStore.value == 1
                        ? Image.asset(
                            AppImages.cat,
                          )
                        : controller.filterStore.value == 2
                            ? Image.asset(
                                AppImages.dog,
                              )
                            : Image.asset(
                                AppImages.noimage,
                              ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: mediaQuery.height * .42,
            child: Container(
              constraints: BoxConstraints(
                minWidth: mediaQuery.width,
                maxHeight: mediaQuery.height * .55,
              ),
              child: Card(
                color: AppColors.ligthGrey,
                elevation: 15,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 5, 18, 3),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      widget.pet.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 192, 11, 11),
                                          fontWeight: FontWeight.bold),
                                      maxLines: 3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        color: AppColors.lightPurple,
                                      ),
                                      Text(
                                        'Localização (2,5km)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Color.fromARGB(255, 92, 85, 85),
                                            fontWeight: FontWeight.bold),
                                        maxLines: 3,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: mediaQuery.width * .1,
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: SizedBox(
                                      width: mediaQuery.width * .22,
                                      height: mediaQuery.height * .1,
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                        elevation: 6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '#${widget.pet.id}',
                                              style:
                                                  getPoppoins20(fontSize: 16),
                                            ),
                                            Text(
                                              'ID',
                                              style: getRegularStyle14(
                                                color: AppColors.lime,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: SizedBox(
                                      width: mediaQuery.width * .22,
                                      height: mediaQuery.height * .1,
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(12),
                                          ),
                                        ),
                                        elevation: 6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              widget.pet.type.description,
                                              minFontSize: 10,
                                              stepGranularity: 10,
                                              maxLines: 1,
                                              style: getPoppoins20(
                                                fontSize: widget.pet.type
                                                            .description ==
                                                        'Gato'
                                                    ? 20
                                                    : 14,
                                              ),
                                            ),
                                            Text(
                                              'Tipo',
                                              style: getRegularStyle14(
                                                color: AppColors.lime,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.background,
                                backgroundImage: AssetImage(
                                  AppImages.contact,
                                ),
                              ),
                              AutoSizeText(
                                'Adriano Bitencourt',
                                minFontSize: 10,
                                stepGranularity: 10,
                                maxLines: 5,
                                style: getRegularStyle14(
                                  fontSize: 11,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    splashRadius: 25,
                                    icon: const Icon(
                                      Icons.phone,
                                      size: 25,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    splashRadius: 25,
                                    icon: const Icon(
                                      Icons.message,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: mediaQuery.width * .005,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SizedBox(
                              width: mediaQuery.width * .35,
                              height: mediaQuery.height * .18,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                elevation: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      widget.pet.origin == ''
                                          ? 'Unknown'
                                          : widget.pet.origin,
                                      textAlign: TextAlign.center,
                                      minFontSize: 10,
                                      stepGranularity: 10,
                                      maxLines: 5,
                                      style: getPoppoins20(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Origem',
                                      style: getRegularStyle14(
                                        color: AppColors.lime,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: SizedBox(
                              width: mediaQuery.width * .35,
                              height: mediaQuery.height * .18,
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                elevation: 6,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: AutoSizeText(
                                          widget.pet.temperament,
                                          minFontSize: 10,
                                          stepGranularity: 10,
                                          maxLines: 5,
                                          textAlign: TextAlign.center,
                                          style: getPoppoins20(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Temperamento',
                                        style: getRegularStyle14(
                                          color: AppColors.lime,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: SizedBox(
                          width: mediaQuery.width * .9,
                          height: mediaQuery.width * .15,
                          child: AutoSizeText(
                            widget.pet.description,
                            minFontSize: 10,
                            maxLines: 8,
                            textAlign: TextAlign.left,
                            style: getRegularStyle14(
                              fontSize: 12,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mediaQuery.width * .95,
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(195, 37),
                                primary: AppColors.secondary,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                              ),
                              child: const Text(
                                'Me adote!',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
