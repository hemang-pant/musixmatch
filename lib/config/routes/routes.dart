import 'package:flutter/material.dart';
import 'package:musixmatch/features/feature_1/domain/entities/track.dart';
import 'package:musixmatch/features/feature_1/presentation/pages/bookmarked_tracks/bookmarked_tracks.dart';
import 'package:musixmatch/features/feature_1/presentation/pages/home/charts.dart';
import 'package:musixmatch/features/feature_1/presentation/pages/track_detail/track_detail.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const Charts());

      case '/TrackDetails':
        return _materialRoute(TrackDetailsView(track: settings.arguments.toString()));

      case '/BookmarkedTracks':
        return _materialRoute(const SavedTracks());
        
      default:
        return _materialRoute(const Charts());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}