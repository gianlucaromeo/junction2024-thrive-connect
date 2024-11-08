import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:junction2024_thrive_connect/extensions.dart';

void setSystemUIOverlayColor(Color color) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
    ),
  );
}

class AppPadding {
  static get scaffoldPadding => [24.0, 24.0, 24.0, 0.0].fromLTRB;
}

class AppColors {
  /* HIGHLIGHTS */
  static get highlightsDarkest => const Color(0xFF006FFD);
  static get highlightsLightest => const Color(0xFFEAF2FF);

  /* NEUTRAL / LIGHT */
  static get neutralLightLightest => const Color(0xFFFFFFFF);
  static get neutralLightLight => const Color(0xFFF8F9FE);
  static get neutralLightMedium => const Color(0xFFE8E9F1);
  static get neutralLightDark => const Color(0xFFD4D6DD);
  static get neutralLightDarkest => const Color(0xFFC5C6CC);

  /* NEUTRAL / DARK **/
  static get neutralDarkDarkest => const Color(0xFF1F2024);
  static get neutralDarkLight => const Color(0xFF71727A);
  static get neutralDarkLightest => const Color(0xFF8F9098);

  /* ERROR */
  static get error => const Color(0xFFED3241);
}

TextStyle _ts(FontWeight fontWeight, double fontSize) {
  return TextStyle(fontWeight: fontWeight, fontSize: fontSize);
}

class AppFonts {
  static get textTheme => GoogleFonts.interTextTheme();

  static get _extraBold => FontWeight.w800;
  static get _bold => FontWeight.w700;
  static get _semiBold => FontWeight.w600;
  static get _medium => FontWeight.w500;
  static get _regular => FontWeight.w400;

  static TextStyle get h1 => _ts(_extraBold, 24.0);
  static TextStyle get h2 => _ts(_extraBold, 18.0);
  static TextStyle get h3 => _ts(_extraBold, 16.0);
  static TextStyle get h4 => _ts(_bold, 14.0);
  static TextStyle get h5 => _ts(_bold, 12.0);

  static TextStyle get bodyXL => _ts(_regular, 18.0);
  static TextStyle get bodyL => _ts(_regular, 16.0);
  static TextStyle get bodyM => _ts(_regular, 14.0);
  static TextStyle get bodyS => _ts(_regular, 12.0);
  static TextStyle get bodyXS => _ts(_medium, 10.0);

  static TextStyle get actionL => _ts(_semiBold, 14.0);
  static TextStyle get actionM => _ts(_semiBold, 12.0);
  static TextStyle get actionS => _ts(_semiBold, 10.0);

  static TextStyle get captionM => _ts(_semiBold, 10.0);
}