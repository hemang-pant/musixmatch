import 'package:musixmatch/core/usecase/usecase.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:musixmatch/features/feature_1/domain/repository/charts_repository.dart';

class RemoveTrackUseCase implements UseCase<void,TrackEntity>{
  
  final TrackRepository _trackRepository;

  RemoveTrackUseCase(this._trackRepository);
  
  @override
  Future<void> call(TrackEntity  track) {
    return _trackRepository.removeTrack(track);
  }
  
}