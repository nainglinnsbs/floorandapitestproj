import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../feat_core.dart';

void console(String tag, Object? object) {
  if (kDebugMode) {
    log('<<< [-$tag-] >>>\n\n$object\n\n');
  }
}

class CoreUtils {
  CoreUtils._();

  static void showErrorDialog(String message, BuildContext context) {
    showAnimatedDialog(
      context,
      shouldDelay: true,
      dialog: AppDialogBox(
        header: Text(
          AppStrings.error,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

String numberFormatToSting(dynamic number) {
  return NumberFormat.decimalPattern().format(number);
  // return '${NumberFormat.decimalPattern().format(number)} MMK';
}

String formatDouble(String value) {
  double? dv = double.tryParse(value);

  if (dv == null) return value;

  return NumberFormat("#,##0.00", "en_US").format(dv);
}
