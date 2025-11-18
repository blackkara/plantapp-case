import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // Home - Greeting
  static TextStyle greetingSmall = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.0, // 100% line height
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle greetingLarge = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 28 / 24, // 28px line height = 1.1667
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Onboarding - Title variations
  static TextStyle titleLargeLight = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w300,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle titleLargeBold = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    height: 1.0,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMedium = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.0,
    letterSpacing: -1,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMediumBold = GoogleFonts.roboto(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    height: 1.0,
    letterSpacing: -1,
    color: AppColors.textPrimary,
  );

  // Body Text
  static TextStyle bodyMedium = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.375,
    letterSpacing: 0,
    color: AppColors.textPrimary,
  );

  // Caption
  static TextStyle caption = GoogleFonts.roboto(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 1.36,
    letterSpacing: 0,
    color: AppColors.textSecondary,
  );

  // Search Widget Text (from Figma)
  static TextStyle searchHint = GoogleFonts.rubik(
    fontSize: 15.5,
    fontWeight: FontWeight.w400,
    height: 1.0, // 100% line height
    letterSpacing: 0.07,
    color: AppColors.searchPlaceholder,
  );

  // Button Text
  static TextStyle button = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
    color: AppColors.buttonText,
  );
}
