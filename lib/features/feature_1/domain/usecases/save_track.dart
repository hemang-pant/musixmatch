
import 'package:musixmatch/core/usecase/usecase.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:musixmatch/features/feature_1/domain/repository/charts_repository.dart';

class SaveTrackUseCase implements UseCase<void,TrackEntity>{
  
  final TrackRepository _trackRepository;

  SaveTrackUseCase(this._trackRepository);
  
  @override
  Future<void> call(TrackEntity ? params) {
    return _trackRepository.saveTrack(params!);
  }
  
}