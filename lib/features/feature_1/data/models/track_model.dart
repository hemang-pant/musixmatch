import 'package:musixmatch/features/feature_1/domain/entities/track.dart';

class TrackModel extends TrackEntity {
  const TrackModel({
    int? id,
    String? name,
    String? artistName ,
    String? albumName ,
    int? artistId ,
    int? albumId ,
    String? genreName ,
    String? genreExtendedName ,
    int? genreId ,
    int? genreExtendedId ,
    String? lyrics ,
    bool ? isExplicit ,
    double ? trackRating ,
    int? lyricsId ,
    int ? numFavourite ,
  });

  factory TrackModel.fromJson(Map < String, dynamic > map){
    return TrackModel(
      name: map['track_name']  ?? '',
      artistName: map['artist_name'] ?? '',
      albumName: map['album_name'] ?? '',
      genreName: map['primary_genres']['music_genre_list'][0]['music_genre']['music_genre_name'] ?? '',
      genreExtendedName: map['primary_genres']['music_genre_list'][0]['music_genre']['music_genre_name_extended'] ?? '',
      lyrics: map['lyrics_body'] ?? '',
    );
  }
}