import 'dart:async';
import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../item/feat_item.dart';
import '../feat_core.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  ItemDto,
])
abstract class AppDatabase extends FloorDatabase {
  ItemDao get itemDao;
}

class AppFloorDB {
  static const String tag = 'AppFloorDB';

  late AppDatabase _instance;
  AppDatabase get instance => _instance;

  bool _hasBeenInitialized = false;

  Future<void> init() async {
    Logger.d(tag, 'Initialize floor database...');

    if (_hasBeenInitialized) return;
    _hasBeenInitialized = true;

    _instance = await $FloorAppDatabase
        .databaseBuilder('simple_app.db')
        // .addMigrations([])
        .build();

    Logger.clap(tag, 'Initialization of floor database success.');
  }
}
