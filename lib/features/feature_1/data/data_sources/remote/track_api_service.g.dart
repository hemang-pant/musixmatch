// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _TrackApiService implements TrackApiService {
  _TrackApiService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.musixmatch.com/ws/1.1/';
  }

  Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<TrackModel>>> getCharts({
    String? apiKey,
    int? page,
    int? pageSize,
    String? country,
    int? hasLyrics,
  }) async {
    _dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onResponse: (response, handler) {
            if (response.requestOptions.method == HttpMethod.GET) {
              response.data = jsonDecode(response.data as String);
            }
            return handler.next(response);
          },
        ),
      );
    log('.g function called');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apikey': apiKey,
      r'page': page,
      r'page_size': pageSize,
      r'country': country,
      r'f_has_lyrics': hasLyrics,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    var _result;
    final temp = await _dio
        .fetch<Map<String, dynamic>>(
            _setStreamType<HttpResponse<List<TrackModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  'chart.tracks.get',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                ))))
        .then((value) {
      log('[API response data]: in next line');
      _result = value;
    });
    log(_result.data['message']['body']['track_list'].length.toString());
    List<TrackModel> value = [];
    for (int i = 0;
        i < _result.data['message']['body']['track_list'].length;
        i++) {
      String name = _result.data['message']['body']['track_list'][i]['track']
          ['track_name'];
      value.add(TrackModel(
        id: _result.data['message']['body']['track_list'][i]['track']
            ['track_id'],
        name: name,
        artistName: _result.data['message']['body']['track_list'][i]['track']
            ['artist_name'],
        albumName: _result.data['message']['body']['track_list'][i]['track']
            ['album_name'],
        genreName: _result.data['message']['body']['track_list'][i]['track']
                ['primary_genres']['music_genre_list'][0]['music_genre']
            ['music_genre_name'],
        genreExtendedName: _result.data['message']['body']['track_list'][i]
                ['track']['primary_genres']['music_genre_list'][0]
            ['music_genre']['music_genre_name_extended'],
        artistId: _result.data['message']['body']['track_list'][i]['track']
            ['artist_id'],
        albumId: _result.data['message']['body']['track_list'][i]['track']
            ['album_id'],
        genreId: _result.data['message']['body']['track_list'][i]['track']
                ['primary_genres']['music_genre_list'][0]['music_genre']
            ['music_genre_id'],
        genreExtendedId: _result.data['message']['body']['track_list'][i]
                ['track']['primary_genres']['music_genre_list'][0]
            ['music_genre']['music_genre_parent_id'],
        isExplicit: (_result.data['message']['body']['track_list'][i]['track']
                    ['explicit'] ==
                0)
            ? false
            : true,
        trackRating: double.parse(_result.data['message']['body']['track_list']
                [i]['track']['track_rating']
            .toString()),
        numFavourite: _result.data['message']['body']['track_list'][i]['track']
            ['num_favourite'],
      ));
    }
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  @override
  Future<HttpResponse<TrackModel>> getTrack({
    String? apiKey,
    int? trackId,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'apikey': apiKey,
      r'track_id': trackId,
    };
    _dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onResponse: (response, handler) {
            if (response.requestOptions.method == HttpMethod.GET) {
              response.data = jsonDecode(response.data as String);
            }
            return handler.next(response);
          },
        ),
      );
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TrackModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'track.get',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    //log(_result.data.toString());
    final _lyricsResult = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TrackModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'track.lyrics.get',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));

    var temp = _result.data!['message']['body']['track'];
    var lyrics =
        _lyricsResult.data!['message']['body']['lyrics']['lyrics_body'];
    log(lyrics.toString());
    final value = TrackModel(
      id: temp['track_id'],
      name: temp['track_name'],
      artistName: temp['artist_name'],
      albumName: temp['album_name'],
      genreName: temp['primary_genres']['music_genre_list'][0]['music_genre']
          ['music_genre_name'],
      genreExtendedName: temp['primary_genres']['music_genre_list'][0]
          ['music_genre']['music_genre_name_extended'],
      artistId: temp['artist_id'],
      albumId: temp['album_id'],
      genreId: temp['primary_genres']['music_genre_list'][0]['music_genre']
          ['music_genre_id'],
      genreExtendedId: temp['primary_genres']['music_genre_list'][0]
          ['music_genre']['music_genre_parent_id'],
      isExplicit: (temp['explicit'] == 0) ? false : true,
      trackRating: double.parse(temp['track_rating'].toString()),
      numFavourite: temp['num_favourite'],
      lyrics: lyrics.toString(),
    );
    log('TrackApiService: getTrack: value: ${value.lyrics}');
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }
}
