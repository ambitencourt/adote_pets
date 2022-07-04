import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../datasources/login_datasource.dart';
import '../../../../../modules/login/data/infra/models/login_model.dart';

class LoginDatasource implements ILoginDatasource {
  SharedPreferences? sharedPreferences;

  init() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }

  @override
  Future<LoginModel?> login({required String email}) async {
    final json = await rootBundle.loadString('assets/login.json');
    final data = await jsonDecode(json);
    final users = (data as List).map((e) => LoginModel.fromMap(e)).toList();

    return users.any((e) => e.email == email)
        ? users.firstWhere((e) => e.email == email)
        : null;
  }

  @override
  Future<void> clear() async {
    await init();

    await sharedPreferences!.remove('email');
  }

  @override
  Future<String?> getLogin() async {
    await init();
    final email = sharedPreferences!.getString('email');

    return email;
  }

  @override
  Future saveLogin({required String email}) async {
    await init();
    await sharedPreferences!.setString('email', email);
  }
}
