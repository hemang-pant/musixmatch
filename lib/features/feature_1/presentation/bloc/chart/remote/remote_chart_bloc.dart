import 'package:musixmatch/core/resources/data_state.dart';
import 'package:musixmatch/features/feature_1/domain/usecases/get_charts.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_chart_event.dart';
import 'package:musixmatch/features/feature_1/presentation/bloc/chart/remote/remote_chart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteChartBloc extends Bloc<RemoteChartEvent, RemoteChartState> {
  final GetChartsUseCase _getArticleUseCase;
  RemoteChartBloc(this._getArticleUseCase) : super(RemoteChartLoading()) {
    on<GetChart>(onGetChart);
  }

  void onGetChart(GetChart event, Emitter<RemoteChartState> emit) async {
    final dataState = await _getArticleUseCase.call(null,
        page: event.page, customCountry: event.customCountry);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteChartSuccess(dataState.data!));
    }

    if ( dataState is DataFailed) {
      emit(RemoteChartFailed(dataState.error!));
    }
    
  }
}
