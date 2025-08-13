import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData darkMode = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.balck,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    ),
    scaffoldBackgroundColor: AppColors.balck,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.balck,
      primary: AppColors.balck,
      secondary: Colors.white,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: AppColors.balck,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.balck,
      ),

      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.gray,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.white, size: 24),
  );
  static ThemeData lightMode = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.balck,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.balck, size: 24),
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white,
      primary: AppColors.white,
      secondary: AppColors.balck,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.balck,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.balck,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.balck,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.balck,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.gray,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.balck,
      ),
    ),
  );
}
