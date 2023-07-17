import 'dart:io';

import 'package:dio/io.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:musixmatch/core/constants/constants.dart';
import 'package:musixmatch/core/resources/data_state.dart';
import 'package:musixmatch/features/feature_1/data/models/track_model.dart';
import 'package:musixmatch/features/feature_1/domain/repository/charts_repository.dart';
import 'package:musixmatch/features/feature_1/data/data_sources/remote/track_api_service.dart';

class TrackRepositoryImpl implements TrackRepository {
  final TrackApiService _trackApiService;

  TrackRepositoryImpl(this._trackApiService);

  @override
  Future<DataState<List<TrackModel>>> getCharts(
      int page, String? customCountry) async {
    try {
      final httpResponse = await _trackApiService.getCharts(
        apiKey: trackAPIKey,
        country: customCountry ?? country,
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
}
