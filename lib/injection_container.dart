import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:musixmatch/features/feature_1/data/data_sources/remote/track_api_service.dart';
import 'package:musixmatch/features/feature_1/domain/usecases/get_charts.dart';

import 'features/feature_1/data/repository/track_repository_impl.dart';
import 'features/feature_1/domain/repository/charts_repository.dart';
import 'features/feature_1/presentation/bloc/chart/remote/remote_chart_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<TrackApiService>(TrackApiService(sl()));

  sl.registerSingleton<TrackRepository>(TrackRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetChartsUseCase>(
    GetChartsUseCase(sl())
  );

  // Blocs
  sl.registerFactory<RemoteChartBloc>(
    () => RemoteChartBloc(sl())
  );

}
