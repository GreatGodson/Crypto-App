import 'package:crypto_app/app/shared/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyThemes {
  /// dark theme
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkThemePrimaryColor,
    colorScheme: const ColorScheme.dark(),
    primaryColor: AppColors.darkThemePrimaryColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.darkThemePrimaryColor,
    ),
    textTheme: const TextTheme(
      headline5: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(color: AppColors.whiteColor, fontSize: 16),
    ),
  );

  ///light theme
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
      ),
    ),
    textTheme: const TextTheme(
        headline5: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
        bodyText2: TextStyle(
          color: AppColors.whiteColor,
        ),
        subtitle2: TextStyle(color: AppColors.blackColor, fontSize: 16)),
  );
}
