// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  AppStyles._();

  // TextField
  static const OutlineInputBorder textFieldEnabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 218, 216, 216)),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
  static const OutlineInputBorder textFieldDisabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
  static const OutlineInputBorder textFieldFocusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
  static const OutlineInputBorder textFieldErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
  static const OutlineInputBorder textFieldFocusedErrorBorder =
      OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  static BoxDecoration boxDecoration() => BoxDecoration(
        color: AppColors.primary.withOpacity(0.03),
        border: Border.all(
          color: AppColors.darkColorSchema.background.withOpacity(0.2),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      );

  static InputDecoration textFieldInputDecoration(
          {required Color fillColor, String? hintText, Widget? icon}) =>
      InputDecoration(
        isDense: true,
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        focusedBorder: AppStyles.textFieldFocusedBorder,
        focusedErrorBorder: AppStyles.textFieldFocusedErrorBorder,
        errorBorder: AppStyles.textFieldErrorBorder,
        enabledBorder: AppStyles.textFieldEnabledBorder,
        disabledBorder: AppStyles.textFieldDisabledBorder,
        suffixIconConstraints:
            const BoxConstraints(minWidth: 23, maxHeight: 20),
        suffixIcon: icon,
        counterText: "",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      );

  static TextStyle validatorTextStyle(int fontSize) =>
      TextStyle(fontSize: fontSize.toDouble(), fontWeight: FontWeight.w400);

  static TextStyle DrawerMenuTitle() => const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 146, 145, 145),
      overflow: TextOverflow.ellipsis);
  static TextStyle DrawerMenuTitleDivider() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 189, 184, 184),
      );

  static ShapeDecoration statusStyle() => ShapeDecoration(
        color: AppColors.primary.withOpacity(0.03),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey.withOpacity(0.3),
            style: BorderStyle.solid,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      );
  static BoxDecoration listTitleBox(BuildContext context) => BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      );
}
