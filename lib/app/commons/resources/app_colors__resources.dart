import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff978A8A);
  static const Color secondary = Color.fromARGB(255, 7, 44, 252);
  static const Color rose = Color(0xffD03363);
  static const Color blue = Color(0xff2C61B0);
  static const Color purple = Color(0xff86249E);
  static const Color lime = Color(0xff1C7A2F);
  static const Color orange = Color(0xffBD4815);
  static const Color background = Color(0xff827397);
  static const Color lightPurple = Color(0xff5F5B5B);
  static const Color lightYellow = Color.fromARGB(255, 241, 239, 195);
  static const Color ligthGrey = Color.fromARGB(255, 229, 227, 238);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff404040);
  static const Color ligthBlack = Color(0xff2B2B2B);
  static const Color whiteOpacity = Color(0xffBDBDBD);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
