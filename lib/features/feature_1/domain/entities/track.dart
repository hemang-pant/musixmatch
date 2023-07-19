import 'package:equatable/equatable.dart';

class TrackEntity extends Equatable {
  final int? id;
  final String? name;
  final String? artistName;
  final String? albumName;
  final int? artistId;
  final int? albumId;
  final String? genreName;
  final String? genreExtendedName;
  final int? genreId;
  final int? genreExtendedId;
  final String? lyrics;
  final bool ? isExplicit;
  final double ? trackRating;
  final int? lyricsId;
  final int ? numFavourite;
  

  const TrackEntity({
    this.id,
    this.name,
    this.artistName,
    this.albumName,
    this.artistId,
    this.albumId,
    this.genreName,
    this.genreExtendedName,
    this.genreId,
    this.genreExtendedId,
    this.lyrics,
    this.isExplicit,
    this.trackRating,
    this.lyricsId,
    this.numFavourite,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        artistName,
        albumName,
        artistId,
        albumId,
        genreName,
        genreExtendedName,
        genreId,
        genreExtendedId,
        lyrics,
        isExplicit,
        trackRating,
        lyricsId,
        numFavourite,
      ];
}
