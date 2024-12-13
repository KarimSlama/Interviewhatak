import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

ThemeData themeDark = ThemeData(
  scaffoldBackgroundColor: AppColors.lightBlack,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.lightBlack,
    secondary: AppColors.lightBlack,
    error: Colors.red,
    onPrimary: AppColors.beig,
    onSecondary: AppColors.beig,
    onSurface: AppColors.silver,
    onError: AppColors.white,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.lightBlack,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.poppins(
      color: AppColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.brown,
      size: 26,
    ),
    toolbarTextStyle: GoogleFonts.poppins(
      color: AppColors.white,
      fontSize: 14,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.black,
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(
      color: AppColors.white,
      fontSize: 16,
    ),
  ),
);
