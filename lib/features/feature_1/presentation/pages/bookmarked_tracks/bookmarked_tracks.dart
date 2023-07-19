import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/local/local_track_bloc.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/local/local_track_event.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/local/local_track_state.dart';
import 'package:musixmatch/features/feature_1/presentation/widgets/track_tile.dart';
import 'package:musixmatch/injection_container.dart';

class SavedTracks extends HookWidget {
  const SavedTracks({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LocalTrackBloc>()..add(const GetSavedTracks()),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      title: const Text('Saved Tracks', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalTrackBloc, LocalTracksState>(
      builder: (context, state) {
        if (state is LocalTracksLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (state is LocalTracksDone) {
          return _buildTracksList(state.tracks!);
        }
        return Container();
      },
    );
  }

  Widget _buildTracksList(List<TrackEntity> tracks) {
    if (tracks.isEmpty) {
      return const Center(
          child: Text(
        'NO SAVED TRACKS',
        style: TextStyle(color: Colors.black),
      ));
    }

    return ListView.builder(
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        return TrackWidget(
          track: tracks[index],
          isRemovable: true,
          onRemove: (track) => _onRemoveTrack(context, track),
          onTrackPressed: (track) => _onTrackPressed(context, track),
        );
      },
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onRemoveTrack(BuildContext context, TrackEntity track) {
    BlocProvider.of<LocalTrackBloc>(context).add(RemoveTrack(track));
  }

  void _onTrackPressed(BuildContext context, TrackEntity track) {
    Navigator.pushNamed(context, '/TrackDetails', arguments: track);
  }
}
