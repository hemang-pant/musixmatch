import 'package:equatable/equatable.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';

abstract class LocalTracksEvent extends Equatable {
  final TrackEntity ? track;

  const LocalTracksEvent({this.track});

  @override
  List<Object> get props => [track!];
}

class GetSavedTracks extends LocalTracksEvent {
  const GetSavedTracks();
}

class RemoveTrack extends LocalTracksEvent {
  const RemoveTrack(TrackEntity track) : super(track: track);
}

class SaveTrack extends LocalTracksEvent {
  const SaveTrack(TrackEntity track) : super(track: track);
}