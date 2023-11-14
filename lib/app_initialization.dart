import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/feat_core.dart';

Future<void> beforeInitialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // initialize prefs
  await initializePrefs();

  // clear old secure storage data after uninstall on ios
  bool isFirstRun = getBoolAsync(AppConsts.prefsFirstRun, defaultValue: true);
  if (isFirstRun) {
    Logger.d("beforeInitialize", "First Run");
    const FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.deleteAll();
    setValue(AppConsts.prefsFirstRun, false);
  }
}
