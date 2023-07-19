import 'package:musixmatch/core/constants/constants.dart';
import 'package:musixmatch/core/resources/data_state.dart';
import 'package:musixmatch/core/usecase/usecase.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:musixmatch/features/feature_1/domain/repository/charts_repository.dart';


class GetTrackUseCase implements UseCase<DataState<TrackEntity>,void> {
  
  
  final TrackRepository _trackRepository;

  GetTrackUseCase(this._trackRepository);
  
  @override
  Future<DataState<TrackEntity>> call(void params, {int? trackId}) {
    return _trackRepository.getTrack(trackId);
  }
}