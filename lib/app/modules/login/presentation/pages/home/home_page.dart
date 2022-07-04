import 'package:adote_pets/app/commons/resources/app_images_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:adote_pets/app/modules/login/presentation/pages/home/home_controller.dart';
import '../../../../../commons/resources/app_colors__resources.dart';
import '../../../../../commons/resources/app_text_styles_resources.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 130,
              ),
              Card(
                color: AppColors.lightYellow,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(31),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      AppImages.login,
                      fit: BoxFit.cover,
                      height: 200,
                      width: 200,
                    ),
                    Text(
                      'Faça login para poder adotar um amigo',
                      style: getRegularStyleW400(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          isDense: false,
                          floatingLabelStyle: const TextStyle(
                            color: AppColors.ligthBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          labelStyle: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                          hintStyle: const TextStyle(
                            color: AppColors.white,
                          ),
                          filled: true,
                          fillColor: AppColors.background,
                          contentPadding:
                              const EdgeInsets.fromLTRB(30, 20, 20, 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        controller: controller.emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: controller.onLoginButtonPressed,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(155, 40),
                        primary: AppColors.secondary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Entrar',
                            textAlign: TextAlign.center,
                            style: getRegularStyle16(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            AppImages.paw,
                            fit: BoxFit.cover,
                            height: 60,
                            width: 60,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Modular.dispose<HomeController>();
    super.dispose();
  }
}
