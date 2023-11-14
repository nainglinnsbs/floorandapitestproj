import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xff1a6fcf); // #244B98 - 37%
  static const Color primary40 = Color(0xff1a6fcf); // #2751a5 - 40%
  static const Color primary80 = Color(0xff1a6fcf); // #acc1ec - 80%

  static const Color secondary = Color(0xff074890); // #55C7EB - 63%
  static const Color secondary40 = Color(0xff074890); // #1591b7 - 40%
  static const Color secondary80 = Color(0xff074890); // #a4e1f4 - 80%
  static const Color containerColor =
      Color.fromARGB(255, 223, 233, 236); // #a4e1f4 - 80%

  static ColorScheme lightColorSchemaFromSeed = ColorScheme.fromSeed(
    seedColor: primary40,
    secondary: secondary40,
    brightness: Brightness.light,
  );

  static ColorScheme darkColorSchemaFromSeed = ColorScheme.fromSeed(
    seedColor: primary80,
    secondary: secondary80,
    brightness: Brightness.dark,
    // primaryContainer: Colors.white,
  );

  static ColorScheme lightColorSchema = const ColorScheme.light(
    primary: primary40,
    secondary: secondary40,
  );

  static ColorScheme darkColorSchema = const ColorScheme.dark(
    primary: primary80,
    secondary: secondary80,
  );
}
