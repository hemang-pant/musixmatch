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
  }): super(
    id: id,
    name: name,
    artistName: artistName,
    albumName: albumName,
    artistId: artistId,
    albumId: albumId,
    genreName: genreName,
    genreExtendedName: genreExtendedName,
    genreId: genreId,
    genreExtendedId: genreExtendedId,
    isExplicit: isExplicit,
    trackRating: trackRating,
    numFavourite: numFavourite,
  );

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

  factory TrackModel.fromEntity(TrackEntity entity){
    return TrackModel(
      id: entity.id,
      name: entity.name,
      artistName: entity.artistName,
      albumName: entity.albumName,
      artistId: entity.artistId,
      albumId: entity.albumId,
      genreName: entity.genreName,
      genreExtendedName: entity.genreExtendedName,
      genreId: entity.genreId,
      genreExtendedId: entity.genreExtendedId,
      isExplicit: entity.isExplicit,
      trackRating: entity.trackRating,
      numFavourite: entity.numFavourite,
    );
  }
}