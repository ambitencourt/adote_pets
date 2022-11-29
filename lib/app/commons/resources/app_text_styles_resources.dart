import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors__resources.dart';

TextStyle getBoldStyle45({
  double fontSize = 45,
  FontWeight fontWeight = FontWeight.w700,
  Color color = AppColors.rose,
  TextDecoration? decoration,
}) {
  return GoogleFonts.pacifico(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

TextStyle getRegularStyleW400({
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w600,
  Color color = AppColors.orange,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyle16({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  Color color = AppColors.white,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getpoppins16(
    {double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    Color color = AppColors.primary}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyle14({
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.w500,
  Color color = AppColors.lightPurple,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyle20({
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w500,
  Color color = AppColors.white,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getPoppins20({
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.w600,
  Color color = AppColors.primary,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
