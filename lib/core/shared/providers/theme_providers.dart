import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../feat_core.dart';

/// We use a simple StateProvider to toggle application ThemeMode.
final StateProvider<ThemeMode> themeModeProvider =
    StateProvider<ThemeMode>((StateProviderRef<ThemeMode> ref) {
  final bool isDarkMode = getBoolAsync(
    AppConsts.prefsDarkMode,
    defaultValue: false,
  );
  return isDarkMode ? ThemeMode.dark : ThemeMode.light;
});

/// The light [ThemeData] provider.
///
/// It is also just a simple StateProvider using our AppTheme.light method
/// and passing other StateProviders as property values to the method.
/// We can use this StateProvider in our MaterialApp as theme. Whenever any
/// of the StateProvider based property value are updated, the MaterialApp
/// will change theme and be rebuilt with new theme applied.
final StateProvider<ThemeData> lightThemeProvider = StateProvider<ThemeData>(
  (StateProviderRef<ThemeData> ref) => AppTheme.light,
);

/// The dark [ThemeData] provider.
///
/// Same setup as the [lightThemeProvider], we just have a few more properties.
final StateProvider<ThemeData> darkThemeProvider = StateProvider<ThemeData>(
  (StateProviderRef<ThemeData> ref) => AppTheme.dark,
);
