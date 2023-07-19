import 'package:equatable/equatable.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:dio/src/dio_exception.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../data/models/track_model.dart';

abstract class RemoteChartState extends Equatable{
  final List<TrackEntity> ? tracks;
  final DioException ? error;

  const RemoteChartState({this.tracks, this.error});

  @override
  List<Object?> get props => [tracks!, error!]; 
}

class RemoteChartLoading extends RemoteChartState {
  const RemoteChartLoading();
}

class RemoteChartSuccess extends RemoteChartState {
  const RemoteChartSuccess(List<TrackEntity> tracks) : super(tracks: tracks);
}

class RemoteChartFailed extends RemoteChartState {
  const RemoteChartFailed(DioException error) : super(error: error);
}