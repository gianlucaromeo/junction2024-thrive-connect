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
  static get redPastel => const Color(0xFFE5AFAF);
  static get redText => const Color(0xFFAF3838);
  static get greenPastel => const Color(0xFFC2D8BE);
  static get greenText => const Color(0xFF38792C);
  static get purplePastel => const Color(0xFFC4BCFF);
  static get purpleText => const Color(0xFF9C3CE7);
  static get black => const Color(0xFF0D0B26);
  static get grey => const Color(0xFFABB7C2);
  static get greyLight => const Color(0xFFF5F5F4);
  static get white => const Color(0xFFFFFFFF);
}

TextStyle _ts(FontWeight fontWeight, double fontSize) {
  return TextStyle(fontWeight: fontWeight, fontSize: fontSize);
}

class AppFonts {
  static get textTheme => GoogleFonts.poppinsTextTheme();

  static get _extraBold => FontWeight.w900;
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