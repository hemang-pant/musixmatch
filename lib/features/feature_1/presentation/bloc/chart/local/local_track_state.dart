import 'package:equatable/equatable.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';

abstract class LocalTracksState extends Equatable {
  final List<TrackEntity> ? tracks;

  const LocalTracksState({this.tracks});

  @override
  List<Object> get props => [tracks!];
}

class LocalTracksLoading extends LocalTracksState {
  const LocalTracksLoading();
}

class LocalTracksDone extends LocalTracksState {
  const LocalTracksDone(List<TrackEntity> tracks) : super(tracks: tracks);
}