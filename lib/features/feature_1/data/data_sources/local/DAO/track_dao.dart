import 'package:floor/floor.dart';

import '../../../models/track_model.dart';

@dao

abstract class TrackDao {
  
  @Insert()
  Future<void> insertTrack(TrackModel track);
  
  @delete
  Future<void> deleteTrack(TrackModel trackModel);
  
  @Query('SELECT * FROM track')
  Future<List<TrackModel>> getTracks();
}