import 'dart:convert';
import 'dart:developer';

import 'package:musixmatch/core/constants/constants.dart';
import 'package:musixmatch/features/feature_1/data/models/track_model.dart';
import 'package:dio/dio.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:retrofit/retrofit.dart';
part 'track_api_service.g.dart';

@RestApi(baseUrl: trackAPIBaseURL)
abstract class TrackApiService {
  factory TrackApiService(Dio dio) = _TrackApiService;

  @GET('chart.tracks.get')
  Future<HttpResponse<List<TrackModel>>> getCharts({
    @Query("apikey") String? apiKey,
    @Query("page") int? page,
    @Query("page_size") int? pageSize,
    @Query("country") String? country,
    @Query("f_has_lyrics") int? hasLyrics,
  });
}
