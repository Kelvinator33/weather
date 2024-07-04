import 'package:flutter/material.dart';

@immutable
class AppColors {
  //? Blues
  static const Color darkBlue = Color(0xFF0A0B39); // dark blue
  static const Color lightBlue = Color(0xFF1D85E4);
  static const Color accentBlue = Color(0xFF23224A);

  static const Color grey = Color(0xFFB7B6C4);
  static const Color blueGrey = Color(0xFF0A0B39);
  static const Color white = Color(0xFFFFFFFF);

  //! Blacks
  static const Color black = Color(0xFF000000);
  static const Color matteBlack = Color(0xFF2B2B2B);
  static const Color glossyBlack = Color(0xFF000000);
  static const Color lightTransparentBlack = Color(0x88000000);
}

@immutable
class TextStyles {
  static const h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static const h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const subtitleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );

  static const largeSubtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
  );
}