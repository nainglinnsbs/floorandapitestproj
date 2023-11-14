import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../../feat_core.dart';

/// Convert `null` value from [Object] to `empty` string.
String stringFromJson(Object? json) => (json as String?) ?? '';

/// Convert `null` value from [Object] to `num`.
num numFromJson(Object? json) => (json as num?) ?? 0;

/// Convert `null` value from [Object] to `bool`.
bool boolFromJson(Object? json) => (json as bool?) ?? false;

/// Decode to json `2nd` time
/// because consuming `SOAP` api need to convert for second time.
T nextDecode<T>(dynamic json, String key) => jsonDecode(json[key]) as T;

/// Convert `data` of [Response] to [T]
T responseData<T>(Response<dynamic> response) => response.data as T;

String getRequestOnDate(DateTime date) {
  return date.formatWithDateFormat(pattern: "dd-MM-yyyy hh:mm a");
}

String getYear(DateTime date) {
  return date.formatWithDateFormat(pattern: "yyyy");
}

DateTime getSubDate(DateTime date, int days) {
  return date.subtract(Duration(days: days));
}

DateTime getAddDate(DateTime date, int days) {
  return date.add(Duration(days: days));
}

List<DateTime> getMonthList(DateTime date) {
  List<DateTime> monthList = [];
  for (var i = 0; i < 12; i++) {
    monthList.add(DateTime(date.year, i + 1, i + 1));
  }
  return monthList;
}

List<DateTime> getDateList(DateTime date) {
  final month = date.month;
  final dayCount = daysInMonth(month, date.year) ?? 0;
  List<DateTime> dateList = [];
  for (var i = 0; i < dayCount; i++) {
    dateList.add(DateTime(date.year, month, i + 1));
  }
  return dateList;
}

int dayCountInMonth({
  DateTime? date,
}) {
  if (date == null) {
    final today = DateTime.now();
    return daysInMonth(today.month, today.year) ?? 0;
  } else {
    return daysInMonth(date.month, date.year) ?? 0;
  }
}

int? daysInMonth(final int monthNum, final int year) {
  if (monthNum > 12) {
    return null;
  }
  List<int> monthLength = List.filled(12, 0);
  monthLength[0] = 31;
  monthLength[2] = 31;
  monthLength[4] = 31;
  monthLength[6] = 31;
  monthLength[7] = 31;
  monthLength[9] = 31;
  monthLength[11] = 31;
  monthLength[3] = 30;
  monthLength[8] = 30;
  monthLength[5] = 30;
  monthLength[10] = 30;

  if (leapYear(year) == true) {
    monthLength[1] = 29;
  } else {
    monthLength[1] = 28;
  }

  return monthLength[monthNum - 1];
}

bool leapYear(int year) {
  bool leapYear = false;
  bool leap = ((year % 100 == 0) && (year % 400 != 0));
  if (leap == true) {
    leapYear = false;
  } else if (year % 4 == 0) {
    leapYear = true;
  }

  return leapYear;
}

DateTime combineDateAndTime(DateTime date, TimeOfDay time) {
  final dwt = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
    date.second,
    date.millisecond,
    date.microsecond,
  );
  return dwt;
}

/// [https://stackoverflow.com/a/70136908](https://stackoverflow.com/a/70136908).
///
/// With some additional logic.
///
/// ```dart
/// String v1 = '1.2.3';
/// String v2 = '1.2.11';
/// int version1Number = getExtendedVersionNumber(v1); // return 102003
/// int version2Number = getExtendedVersionNumber(v2); // return 102011
/// print(version1Number == version2Number); // true
/// print(version1Number >= version2Number); // true
/// print(version1Number < version2Number); // false
/// ```
int getExtendedVersionNumber(
  String version, {
  bool patch = true,
  String? buildNumber,
}) {
  // Note that if you want to support bigger version cells than 99,
  // just increase the returned versionCells multipliers
  List versionCells = version.split('.');
  versionCells = versionCells.map((i) => int.parse(i)).toList();

  if (patch) {
    if (buildNumber == null) {
      return versionCells[0] * 10000 + versionCells[1] * 100 + versionCells[2];
    }

    final buildNo = int.parse(buildNumber);
    return versionCells[0] * 10000 +
        versionCells[1] * 100 +
        versionCells[2] +
        buildNo;
  } else {
    if (buildNumber == null) {
      return versionCells[0] * 10000 + versionCells[1] * 100;
    }

    final buildNo = int.parse(buildNumber);
    return versionCells[0] * 10000 + versionCells[1] * 100 + buildNo;
  }
}

/// helper function to check if an input matches a given pattern
bool hasMatch(String pattern, String input, {bool caseSensitive = true}) =>
    RegExp(pattern, caseSensitive: caseSensitive).hasMatch(input);

Color getStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.primaryContainer;
  } else if (status == AppStrings.statusRequested) {
    return Colors.green;
  } else if (status == AppStrings.statusApproved) {
    return Colors.blueGrey;
  } else if (status == AppStrings.statusCancelled) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.primaryContainer;
  }
}

Color getReqStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.primary.withOpacity(0.3);
  } else if (status == AppStrings.statusRequested) {
    return Colors.green;
  } else if (status == AppStrings.statusApproved) {
    return Colors.blueGrey;
  } else if (status == AppStrings.statusCancelled) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}

Color getInvStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.primary.withOpacity(0.3);
  } else if (status == AppStrings.statusCompleted) {
    return Colors.green;
  } else if (status == AppStrings.statusNew) {
    return Theme.of(context).colorScheme.onBackground.withOpacity(0.05);
  } else if (status == AppStrings.statusCancelled) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}

Color getSaleReturnStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.primary.withOpacity(0.3);
  } else if (status == AppStrings.statusApproved) {
    return Colors.green;
  } else if (status == AppStrings.statusNew) {
    return Theme.of(context).colorScheme.onBackground.withOpacity(0.05);
  } else if (status == AppStrings.statusCancelled) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}

Color getExceptionStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.primary.withOpacity(0.3);
  } else if (status == AppStrings.statusCompleted) {
    return Colors.green;
  } else if (status == AppStrings.statusNew) {
    return Theme.of(context).colorScheme.onBackground.withOpacity(0.05);
  } else if (status == AppStrings.statusRejected) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}

Color getInvItemStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.primary.withOpacity(0.3);
  } else if (status == AppStrings.statusCompleted) {
    return Colors.green;
  } else if (status == AppStrings.statusNew) {
    return Colors.yellow.shade700;
  } else if (status == AppStrings.statusCancelled) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}

Color getReceiveStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.primary.withOpacity(0.3);
  } else if (status == AppStrings.statusReceived) {
    return Colors.green;
  } else if (status == AppStrings.statusNew) {
    return Theme.of(context).colorScheme.onBackground.withOpacity(0.05);
  } else if (status == AppStrings.statusCancelled) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}

Color getOrderStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.background;
  } else if (status == AppStrings.statusOrdered) {
    return Colors.green;
  } else if (status == AppStrings.statusNew) {
    return Theme.of(context).colorScheme.onBackground.withOpacity(0.05);
  } else if (status == AppStrings.statusCancelled) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}

Color getIssueStatusColor(BuildContext context, String status) {
  if (status.isEmpty) {
    return Theme.of(context).colorScheme.background;
  } else if (status == AppStrings.statusIssued) {
    return Colors.green;
  } else if (status == AppStrings.statusNew) {
    return Theme.of(context).colorScheme.onBackground.withOpacity(0.05);
  } else if (status == AppStrings.statusRejected) {
    return Colors.red.withOpacity(0.4);
  } else {
    return Theme.of(context).colorScheme.background;
  }
}
