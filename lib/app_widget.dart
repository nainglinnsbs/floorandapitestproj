import 'package:flutter/material.dart';

import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'core/feat_core.dart';
import 'router/app_router.dart';

final initializationProvider = FutureProvider<Unit>(
  (ref) async {
    final dio = ref.watch(dioProvider);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: false,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    await ref.read(appFloorDBProvider).init();

    return unit;
  },
);

class AppWidget extends ConsumerWidget {
  AppWidget({
    super.key,
  });

  static const String tag = 'AppWidget';

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (previous, next) {});

    return MaterialApp.router(
      title: 'Simple App',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      darkTheme: ref.watch(darkThemeProvider),
      themeMode: ref.watch(themeModeProvider),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
