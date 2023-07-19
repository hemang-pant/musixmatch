import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/core/resources/data_state.dart';
import 'package:musixmatch/features/feature_1/domain/usecases/get_track.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_track_event.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_track_state.dart';

class RemoteTrackBloc extends Bloc<RemoteTrackEvent, RemoteTrackState> {
  final GetTrackUseCase _getTrackUseCase;
  RemoteTrackBloc(this._getTrackUseCase) : super(const RemoteTrackLoading()) {
    on<GetTrack>(onGetTrack);
  }

  void onGetTrack(GetTrack event, Emitter<RemoteTrackState> emit) async {
    final dataState = await _getTrackUseCase.call(null, trackId: event.trackId!);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteTrackSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      log(dataState.error.toString());
      emit(RemoteTrackFailed(dataState.error!));
    }
  }
}
