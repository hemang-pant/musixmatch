// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TrackDao? _trackDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `track` (`id` INTEGER, `artistName` TEXT, `name` TEXT, `lyrics` TEXT, `albumName` TEXT, `artistId` INTEGER, `albumId` INTEGER, `genreName` TEXT, `genreId` INTEGER, `genreExtendedId` INTEGER, `trackRating` REAL, `lyricsId` INTEGER, `numFavourite` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TrackDao get trackDAO {
    return _trackDAOInstance ??= _$TrackDao(database, changeListener);
  }
}

class _$TrackDao extends TrackDao {
  _$TrackDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _trackModelInsertionAdapter = InsertionAdapter(
            database,
            'track',
            (TrackModel item) => <String, Object?>{
                  'id': item.id,
                  'artistName': item.artistName,
                  'name': item.artistName,
                  'lyrics': item.lyrics,
                  'albumName': item.albumName,
                  'artistId': item.artistId,
                  'albumId': item.albumId,
                  'genreName': item.genreName,
                  'genreExtendedName': item.genreExtendedName,
                  'genreId': item.genreId,
                  'genreExtendedId': item.genreExtendedId,
                  'isExplicit': item.isExplicit,
                  'trackRating': item.trackRating,
                  'lyricsId': item.lyricsId,
                  'numFavourite': item.numFavourite


                }),
        _trackModelDeletionAdapter = DeletionAdapter(
            database,
            'track',
            ['id'],
            (TrackModel item) => <String, Object?>{
                  'id': item.id,
                  'artistName': item.artistName,
                  'name': item.name,
                  'lyrics': item.lyrics,
                  'albumName': item.albumName,
                  'artistId': item.artistId,
                  'albumId': item.albumId,
                  'genreName': item.genreName,
                  'genreExtendedName': item.genreExtendedName,
                  'genreId': item.genreId,
                  'genreExtendedId': item.genreExtendedId,
                  'isExplicit': item.isExplicit,
                  'trackRating': item.trackRating,
                  'lyricsId': item.lyricsId,
                  'numFavourite': item.numFavourite
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TrackModel> _trackModelInsertionAdapter;

  final DeletionAdapter<TrackModel> _trackModelDeletionAdapter;

  @override
  Future<List<TrackModel>> getTracks() async {
    return _queryAdapter.queryList('SELECT * FROM track',
        mapper: (Map<String, Object?> row) => TrackModel(

          id: row['id'] as int?,
          artistName: row['artistname'] as String?,
          name: row['name'] as String?,
          lyrics: row['lyrics'] as String?,
          albumName: row['albumname'] as String?,
          artistId: row['artistid'] as int?,
          albumId: row['albumid'] as int?,
          genreName: row['genrename'] as String?,
          genreExtendedName: row['genreextendedname'] as String?,
          genreId: row['genreid'] as int?,
          genreExtendedId: row['genreextendedid'] as int?,
          isExplicit: row['isexplicit'] == null ? null : (row['isexplicit'] as int) != 0,
          trackRating: row['trackrating'] as double?,
          lyricsId: row['lyricsid'] as int?,
          numFavourite: row['numfavourite'] as int?,
        ));
  }

  @override
  Future<void> insertTrack(TrackModel track) async {
    await _trackModelInsertionAdapter.insert(
        track, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteTrack(TrackModel trackModel) async {
    await _trackModelDeletionAdapter.delete(trackModel);
  }
}
