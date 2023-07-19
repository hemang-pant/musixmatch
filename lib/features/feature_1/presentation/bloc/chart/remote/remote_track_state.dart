import 'package:equatable/equatable.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:dio/src/dio_exception.dart';

abstract class RemoteTrackState extends Equatable{
  final TrackEntity ? track;
  final DioException ? error;

  const RemoteTrackState({this.track, this.error});

  @override
  List<Object?> get props => [track!, error!]; 
}

class RemoteTrackLoading extends RemoteTrackState {
  const RemoteTrackLoading();
}

class RemoteTrackSuccess extends RemoteTrackState {
  const RemoteTrackSuccess(TrackEntity track) : super(track: track);
}

class RemoteTrackFailed extends RemoteTrackState {
  const RemoteTrackFailed(DioException error) : super(error: error);
}