import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    actionsIconTheme: IconThemeData(color: AppColors.black, size: 26),
    toolbarTextStyle: GoogleFonts.manrope(
      color: AppColors.black,
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
      color: AppColors.brown,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
);
