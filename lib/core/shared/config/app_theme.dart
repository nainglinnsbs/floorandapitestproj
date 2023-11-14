import 'package:flutter/material.dart';

import '../../feat_core.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: AppColors.lightColorSchemaFromSeed,
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: ),

        // textTheme: const TextTheme(
        //   titleMedium: TextStyle(
        //     fontSize: 14,
        //     color: Colors.black,
        //   ),
        // ),
        // cardTheme: const CardTheme(color: Colors.grey),

        // Elevated button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConsts.buttonRadius),
            ),
          ),
        ),

        // Input decoration
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary80,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary80,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary80,
            ),
          ),
        ),

        // Checkbox
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(
            AppColors.lightColorSchema.primary,
          ),
          checkColor: MaterialStateProperty.all<Color>(
            AppColors.lightColorSchema.onPrimary,
          ),
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: AppColors.darkColorSchemaFromSeed,
        // textTheme: const TextTheme(
        //   titleMedium: TextStyle(
        //     fontSize: 14,
        //     color: Colors.white,
        //   ),
        //   bodyMedium: TextStyle(
        //     fontSize: 18,
        //     color: Colors.white,
        //   ),
        // ),
        cardTheme: const CardTheme(color: Colors.red),
        // Elevated button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConsts.buttonRadius),
            ),
          ),
        ),

        // Input decoration
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary80,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary80,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary80,
            ),
          ),
        ),

        // Checkbox
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(
            AppColors.darkColorSchema.primaryContainer,
          ),
          checkColor: MaterialStateProperty.all<Color>(
            AppColors.darkColorSchema.onPrimaryContainer,
          ),
        ),
      );
}
