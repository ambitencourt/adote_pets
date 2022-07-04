import 'package:adote_pets/app/commons/resources/app_colors__resources.dart';
import 'package:adote_pets/app/commons/resources/app_images_resources.dart';
import 'package:adote_pets/app/commons/resources/app_text_styles_resources.dart';
import 'package:adote_pets/app/modules/pets/presentation/pages/home/widgets/drawer_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'view_model/home_view_model.dart';
import 'widgets/filter_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        drawer: DrawerMenu(),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColors.primary,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          backgroundColor: AppColors.white,
          actions: [
            IconButton(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                size: 30,
                color: AppColors.primary,
              ),
            ),
            IconButton(
              padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
              onPressed: controller.logout,
              icon: const Icon(
                Icons.logout,
                size: 35,
                color: AppColors.primary,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: mediaQuery.width,
                height: mediaQuery.height * .20,
                child: Card(
                  color: AppColors.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          AppImages.frame,
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(18, 18, 140, 0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Comunidade amante dos animais',
                                  textAlign: TextAlign.left,
                                  style: getRegularStyle20(fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mediaQuery.height * .005,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 5, 5, 5),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                      mediaQuery.width * .43,
                                      mediaQuery.height * .05,
                                    ),
                                    primary: AppColors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Junte-se a nós',
                                    style: getpoppins16(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categorias',
                  style: getPoppoins20(),
                ),
              ),
            ),
            ValueListenableBuilder<int>(
                valueListenable: controller.filterStore,
                builder: (context, value, _) {
                  return FilterWidget(
                    groupValue: value,
                    onChanged: controller.changeType,
                  );
                }),
            const SizedBox(
              height: 15,
            ),
            ValueListenableBuilder<HomeViewModel>(
                valueListenable: controller.store,
                builder: (context, value, _) {
                  if (value.snapshot.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  //Lista de Pets
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        final item = value.listFiltered[index];
                        return InkWell(
                          onTap: () {
                            Modular.to.pushNamed('details', arguments: item);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GridTile(
                                footer: GridTileBar(
                                    leading: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Wrap(
                                          children: [
                                            AutoSizeText(
                                              item.name,
                                              minFontSize: 10,
                                              stepGranularity: 10,
                                              maxLines: 1,
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                  fontSize:
                                                      mediaQuery.height * .012,
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: AppColors.rose,
                                            ),
                                            Text(
                                              'Localização (2,5km)',
                                              style: getRegularStyle14(
                                                  color: AppColors.lightYellow,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(155, 78, 76, 76)),
                                child: FancyShimmerImage(
                                  imageUrl: item.image,
                                  //width: 140,
                                  height: 150,
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
                          ),
                        );
                      },
                      itemCount: value.listFiltered.length,
                    ),
                  );
                }),
          ],
        ));
  }

  @override
  void dispose() {
    Modular.dispose<HomeController>();
    super.dispose();
  }
}
