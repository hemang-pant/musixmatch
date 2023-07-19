import 'package:flutter/foundation.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/track.dart';
import '../repository/charts_repository.dart';

class GetSavedTrackUseCase implements UseCase<List<TrackEntity>,void>{
  
  final TrackRepository _trackRepository;

  GetSavedTrackUseCase(this._trackRepository);
  
  @override
  Future<List<TrackEntity>> call(void params,{Key? key,}) {
    return _trackRepository.getSavedTracks();
  }
}