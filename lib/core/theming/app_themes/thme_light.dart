import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

ThemeData themeLight = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.brown,
    secondary: AppColors.white,
    error: Colors.red,
    onPrimary: AppColors.beig,
    onSecondary: AppColors.beig,
    onSurface: AppColors.silver,
    onError: AppColors.white,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.poppins(
      color: AppColors.brown,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(color: AppColors.brown, size: 26),
    toolbarTextStyle: GoogleFonts.poppins(
      color: AppColors.brown,
      fontSize: 14,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.brown,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.brown,
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(
      color: AppColors.brown,
      fontSize: 16,
    ),
  ),
);
