import 'dart:io';

import '../../feat_core.dart';
import 'package:path_provider/path_provider.dart';

class StorageHelpers {
  static final StorageHelpers _instance = StorageHelpers._();

  static StorageHelpers get instance => _instance;

  StorageHelpers._();

  Future<String?> get _localPath async {
    // ignore: prefer_typing_uninitialized_variables
    var directory;

    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }

    return directory?.path;
  }

  Future<File> get _localFile async {
    final path = "${await _localPath}/MixinData";

    // creating directory
    Directory(path).create()
        // The created directory is returned as a Future.
        .then((Directory value) {
      Logger.clap("StorageHelpers", value.path);
    });

    // opening file
    var file = File("$path/app_log.txt");
    var isExist = await file.exists();

    // check to see if file exist
    if (isExist) {
      Logger.i(
        "StorageHelpers",
        'File exists------------------>_getLocalFile()',
      );
    } else {
      Logger.i(
        "StorageHelpers",
        'File does not exist---------->_getLocalFile()',
      );
    }

    return file;
  }

  /// Read the Log-String from file
  Future<String> readLogsToFile() async {
    try {
      final file = await _localFile;

      // Read the file
      var contents = await file.readAsString();

      return contents;
    } catch (e) {
      return "Unable to read file";
    }
  }

  /// Writes the `log`-String to file
  Future<File> writeLogsToFile(String log) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(log);
  }
}
