import 'package:flutter/material.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';
import 'package:plantapp_case/core/theme/app_dimensions.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.buttonText,
        surface: AppColors.background,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: TextTheme(
        titleLarge: AppTextStyles.titleLargeBold,
        titleMedium: AppTextStyles.titleMedium,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.caption,
        labelLarge: AppTextStyles.button,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.buttonText,
          minimumSize: const Size(double.infinity, AppDimensions.buttonHeight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimensions.buttonBorderRadius)),
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.lg - AppSpacing.greetingGap,
            horizontal: AppSpacing.md,
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        onPrimary: AppColors.darkButtonText,
        surface: AppColors.darkBackground,
        onSurface: AppColors.darkTextPrimary,
      ),
    );
  }
}
