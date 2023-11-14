import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_app/app_initialization.dart';

import 'app_widget.dart';

void main() async {
  await beforeInitialize();

  runApp(
    ProviderScope(
      child: AppWidget(),
    ),
  );
}
