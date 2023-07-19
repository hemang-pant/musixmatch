import 'dart:developer';
import 'dart:io';

import 'package:dio/io.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:musixmatch/core/constants/constants.dart';
import 'package:musixmatch/core/resources/data_state.dart';
import 'package:musixmatch/features/feature_1/data/models/track_model.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:musixmatch/features/feature_1/domain/repository/charts_repository.dart';
import 'package:musixmatch/features/feature_1/data/data_sources/remote/track_api_service.dart';

import '../data_sources/local/app_database.dart';

class TrackRepositoryImpl implements TrackRepository {
  final TrackApiService _trackApiService;
  final AppDatabase _appDatabase;

  TrackRepositoryImpl(this._trackApiService, this._appDatabase);

  @override
  Future<DataState<List<TrackModel>>> getCharts(
      int? page, String? customCountry) async {
    try {
      log('TrackRepositoryImpl: getCharts: page: $page, customCountry: $customCountry');
      final httpResponse = await _trackApiService.getCharts(
        apiKey: trackAPIKey,
        country: (customCountry != null && customCountry.isNotEmpty)
            ? customCountry
            : country,
        page: page,
        pageSize: pageSize,
        hasLyrics: hasLyrics,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<TrackModel>> getTrack(int? trackId) async {
    try {
      log('TrackRepositoryImpl: getTrack: trackId: $trackId');
      final httpResponse = await _trackApiService.getTrack(
        apiKey: trackAPIKey,
        trackId: trackId,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<TrackModel>> getSavedTracks() async {
    return _appDatabase.trackDAO.getTracks();
  }

  @override
  Future<void> removeTrack(TrackEntity track) {
    return _appDatabase.trackDAO.deleteTrack(TrackModel.fromEntity(track));
  }

  @override
  Future<void> saveTrack(TrackEntity track) {
    return _appDatabase.trackDAO.insertTrack(TrackModel.fromEntity(track));
  }
  
  

}
