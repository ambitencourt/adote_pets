import 'package:adote_pets/app/commons/resources/app_images_resources.dart';
import 'package:adote_pets/app/commons/resources/app_text_styles_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import '../../../../../commons/resources/app_colors__resources.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                //child: CircularProgressIndicator(),
                child: Hero(
                  tag: 'splash',
                  child: Lottie.asset(
                    AppImages.splash,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ),
              ),
              Text(
                'Adote Pets',
                style: getBoldStyle45(),
              ),
              const Spacer(
                flex: 2,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Lottie.asset(
                  AppImages.loading,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    Modular.dispose<HomeController>();
    super.dispose();
  }
}
