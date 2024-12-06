import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interviewhatak/core/theming/app_colors/app_colors.dart';

ThemeData themeDark = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.light(
    primary: AppColors.brown,
    secondary: AppColors.black,
    error: Colors.red,
    onPrimary: AppColors.beig,
    onSecondary: AppColors.beig,
    onSurface: AppColors.silver,
    onError: AppColors.black,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.poppins(
      color: AppColors.brown,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.white,
      size: 26,
    ),
    toolbarTextStyle: GoogleFonts.manrope(
      color: AppColors.white,
      fontSize: 14,
    ),
    iconTheme:  const IconThemeData(
      color: AppColors.white,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.white,
  ),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(
      color: AppColors.brown,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  ),
);
