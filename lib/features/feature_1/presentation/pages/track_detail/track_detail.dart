import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/local/local_track_bloc.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/local/local_track_event.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_track_bloc.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_track_event.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_track_state.dart';
import 'package:musixmatch/injection_container.dart';
import 'package:retrofit/retrofit.dart';

class TrackDetailsView extends HookWidget {
  final String? track;

  const TrackDetailsView({Key? key, this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RemoteTrackBloc>()..add(GetTrack(trackId: double.parse(track!).toInt())),
      child: Scaffold(
        body: _buildBody(),
        appBar: _buildAppBar(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(

      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBackButtonTapped(context),
          child: const Icon(Ionicons.chevron_back, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<RemoteTrackBloc, RemoteTrackState>(
      builder: (_, state) {
        if (state is RemoteTrackLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is RemoteTrackSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildTrackTitleAndDate(state.track!),
                _buildTrackImage(),
                _buildTrackDescription(state.track!),
              ],
            ),
          );
        }
        if (state is RemoteTrackFailed) {
          return Center(child: Text(state.error!.toString()));
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildTrackTitleAndDate(TrackEntity track) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            track.name!,
            style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),

          const SizedBox(height: 14),
          // Track Details
          SingleChildScrollView(
            //padding: const EdgeInsets.all(8.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Icon(Icons.person_2_rounded, size: 16),
                const SizedBox(width: 4),
                Text(
                  track.artistName!,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(' • ', style: const TextStyle(fontSize: 12)),
                Icon(Icons.album, size: 16),
                Text(
                  track.albumName! ?? 'Unknown Album',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: Row(
              children: [
                Icon(Icons.favorite, size: 16),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      track.numFavourite.toString() ?? '0',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  (track.isExplicit!)?
                    Icon(Icons.explicit) : Text(''),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Genre: ${track.genreName}'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackImage() {
    return Container(
        width: double.maxFinite,
        height: 250,
        margin: const EdgeInsets.only(top: 14),
        child: Icon(
          Ionicons.musical_notes_outline,
          size: 100,
          color: Colors.grey.shade300,
        ));
  }

  Widget _buildTrackDescription(TrackEntity track) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        ' Lyrics: ${track.lyrics}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _buildFloatingActionButton(TrackEntity track) {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButtonPressed(context, track),
        child: const Icon(Ionicons.bookmark, color: Colors.white),
      ),
    );
  }

  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  void _onFloatingActionButtonPressed(BuildContext context, TrackEntity track) {
    log('Saving track...');
    BlocProvider.of<LocalTrackBloc>(context).add(SaveTrack(track!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Track saved successfully.'),
      ),
    );
  }
}
