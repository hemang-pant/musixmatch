import 'package:floor/floor.dart';
import 'package:floor_annotation/floor_annotation.dart';
import 'package:musixmatch/features/feature_1/data/data_sources/local/DAO/track_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:musixmatch/features/feature_1/data/models/track_model.dart';
part 'app_database.g.dart';

//@Database(version: 1, entities: [ TrackModel])
abstract class AppDatabase extends FloorDatabase {
  TrackDao get trackDAO;
}
