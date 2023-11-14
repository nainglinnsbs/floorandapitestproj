import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../home/presentation/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, path: '/home'),
  ],
)
class AppRouter extends _$AppRouter {}
