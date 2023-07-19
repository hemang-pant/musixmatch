import 'package:musixmatch/features/feature_1/domain/entities/track.dart';

import '../../../../core/resources/data_state.dart';

abstract class TrackRepository {

  
  Future<DataState<List<TrackEntity>>> getCharts(int? page, String? customCountry);

  Future < List < TrackEntity >> getSavedTracks();

  Future < void > saveTrack(TrackEntity track);

  Future < void > removeTrack(TrackEntity track);

  Future <DataState< TrackEntity >> getTrack(int? trackId);
}