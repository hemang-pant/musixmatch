import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musixmatch/features/feature_1/domain/usecases/remove_track.dart';
import 'package:musixmatch/features/feature_1/domain/usecases/save_track.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/local/local_track_event.dart';

import '../../../../domain/usecases/get_saved_track.dart';
import 'local_track_state.dart';

class LocalTrackBloc extends Bloc<LocalTracksEvent, LocalTracksState> {
  final GetSavedTrackUseCase _getSavedTrackUseCase;
  final SaveTrackUseCase _saveTrackUseCase;
  final RemoveTrackUseCase _removeTrackUseCase;

  LocalTrackBloc(this._getSavedTrackUseCase, this._saveTrackUseCase,
      this._removeTrackUseCase)
      : super(const LocalTracksLoading()) {
    on<GetSavedTracks>(onGetSavedTracks);
    on<RemoveTrack>(onRemoveTrack);
    on<SaveTrack>(onSaveTrack);
  }

  void onGetSavedTracks(
      GetSavedTracks event, Emitter<LocalTracksState> emit) async {
    final tracks = await _getSavedTrackUseCase(event.track);
    emit(LocalTracksDone(tracks));
  }

  void onRemoveTrack(
      RemoveTrack removeTrack, Emitter<LocalTracksState> emit) async {
    await _removeTrackUseCase(removeTrack.track!);
    final tracks = await _getSavedTrackUseCase(removeTrack.track!.id);
    emit(LocalTracksDone(tracks));
  }

  void onSaveTrack(SaveTrack saveTrack, Emitter<LocalTracksState> emit) async {
    log('running bloc');
    await _saveTrackUseCase(saveTrack.track);
    final tracks = await _getSavedTrackUseCase(saveTrack.track!.id);
    emit(LocalTracksDone(tracks));
  }
}
