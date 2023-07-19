import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:musixmatch/features/feature_1/data/data_sources/remote/track_api_service.dart';
import 'package:musixmatch/features/feature_1/domain/usecases/get_charts.dart';
import 'package:musixmatch/features/feature_1/domain/usecases/save_track.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_track_bloc.dart';

import 'features/feature_1/data/data_sources/local/app_database.dart';
import 'features/feature_1/data/repository/track_repository_impl.dart';
import 'features/feature_1/domain/repository/charts_repository.dart';
import 'features/feature_1/domain/usecases/get_saved_track.dart';
import 'features/feature_1/domain/usecases/get_track.dart';
import 'features/feature_1/domain/usecases/remove_track.dart';
import 'features/feature_1/presentation/bloc/chart/local/local_track_bloc.dart';
import 'features/feature_1/presentation/bloc/chart/remote/remote_chart_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //Dio

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<TrackApiService>(TrackApiService(sl()));

  sl.registerSingleton<TrackRepository>(TrackRepositoryImpl(sl(), sl()));

  //UseCases
  sl.registerSingleton<GetChartsUseCase>(
    GetChartsUseCase(sl())
  );
  sl.registerSingleton<GetTrackUseCase>(
    GetTrackUseCase(sl())
  );


  sl.registerSingleton<SaveTrackUseCase>(
    SaveTrackUseCase(sl())
  );

  sl.registerSingleton<RemoveTrackUseCase>(
    RemoveTrackUseCase(sl())
  );

  sl.registerSingleton<GetSavedTrackUseCase>(
    GetSavedTrackUseCase(sl())
  );

  // Blocs
  sl.registerFactory<RemoteChartBloc>(
    () => RemoteChartBloc(sl())
  );

  sl.registerFactory<RemoteTrackBloc>(
    () => RemoteTrackBloc(sl())
  );

  sl.registerFactory<LocalTrackBloc>(
    () => LocalTrackBloc(sl(), sl(), sl())
  );

}
