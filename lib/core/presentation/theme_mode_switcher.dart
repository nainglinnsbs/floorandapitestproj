import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../feat_core.dart';

class ThemeModeSwitcher extends ConsumerWidget {
  const ThemeModeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    void changeThemeMode(bool isDark) async {
      if (themeMode == ThemeMode.dark) {
        ref.read(themeModeProvider.notifier).state = ThemeMode.light;
        await setValue(AppConsts.prefsDarkMode, false);
      } else if (themeMode == ThemeMode.light) {
        ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
        await setValue(AppConsts.prefsDarkMode, true);
      }
    }

    return SwitchListTile.adaptive(
      value: themeMode == ThemeMode.dark,
      onChanged: changeThemeMode,
      activeColor: Theme.of(context).colorScheme.secondary,
      title: const Text('Dark mode'),
      secondary: Icon(
          themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
          color: themeMode == ThemeMode.dark
              ? Colors.white
              : Colors.yellow.shade800),
    );
  }
}
