import 'package:musixmatch/core/constants/constants.dart';
import 'package:musixmatch/core/resources/data_state.dart';
import 'package:musixmatch/core/usecase/usecase.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';

import '../repository/charts_repository.dart';

class GetChartsUseCase implements UseCase<DataState<List<TrackEntity>>,void> {
  
  
  final TrackRepository _trackRepository;

  GetChartsUseCase(this._trackRepository);
  
  @override
  Future<DataState<List<TrackEntity>>> call(void params, {int? page = 1, String? customCountry = country}) {
    return _trackRepository.getCharts(page, customCountry);
  }
}